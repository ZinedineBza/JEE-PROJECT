package org.example.spring_boot.Servlet.Resultat;
import jakarta.servlet.http.HttpSession;
import org.example.spring_boot.Modele.DAO.ResultatRepository;
import org.example.spring_boot.Modele.Resultat;
import org.example.spring_boot.Modele.Utilisateur;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.xml.transform.Result;
import java.util.List;
import java.util.Objects;

@Controller
public class ListResultatsController {

    private final ResultatRepository resultatDAO;

    public ListResultatsController(ResultatRepository resultatDAO) {
        this.resultatDAO = resultatDAO;
    }

    @GetMapping("/resultats/list")
    public String listResultats(HttpSession session, Model model) {
        // Récupérer l'utilisateur connecté
        Utilisateur user = (Utilisateur) session.getAttribute("user");
        if (user == null) {
            // Rediriger vers la page de connexion si l'utilisateur n'est pas connecté
            return "redirect:/index";
        }

        List<Resultat> resultats;

        // Vérification du rôle de l'utilisateur
        if (Objects.equals(user.getRole(), "enseignant")) {
            // Récupérer les résultats associés à l'enseignant
            resultats = resultatDAO.findResultatByEnseignant(user.getEmail());
            System.out.println("Enseignant connecté : " + user.getEmail());
        } else if (Objects.equals(user.getRole(), "admin")) {
            // Récupérer tous les résultats pour un administrateur
            resultats = resultatDAO.getAll();
            System.out.println("Administrateur connecté : " + user.getEmail());
        } else {
            // Si l'utilisateur n'a pas les droits requis, rediriger vers l'accueil
            return "redirect:/index";
        }

        // Debugging : afficher la taille de la liste
        System.out.println("Nombre de résultats récupérés : " + resultats.size());

        // Ajouter les résultats au modèle pour la vue
        model.addAttribute("resultats", resultats);

        return "Admin/ResultatList"; // Correspond à /WEB-INF/jsp/Admin/ResultatList.jsp
    }
}
