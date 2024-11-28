package org.example.spring_boot.Servlet.Enseignant;
import jakarta.servlet.http.HttpSession;
import org.example.spring_boot.Modele.DAO.ResultatRepository;
import org.example.spring_boot.Modele.Resultat;
import org.example.spring_boot.Modele.Utilisateur;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ListResultatsEnseignantController {

    private final ResultatRepository resultatDAO;

    public ListResultatsEnseignantController(ResultatRepository resultatDAO) {
        this.resultatDAO = resultatDAO;
    }

    @GetMapping("/enseignant/listResultatsEnseignant")
    public String listResultatsEnseignant(HttpSession session, Model model) {
        try {
            // Récupération de l'utilisateur connecté
            Utilisateur enseignant = (Utilisateur) session.getAttribute("user");

            if (enseignant == null) {
                // Rediriger vers la page de connexion si l'utilisateur n'est pas connecté
                return "redirect:/";
            }

            String enseignantEmail = enseignant.getEmail();
            System.out.println("Email de l'enseignant : " + enseignantEmail);

            // Récupération des résultats pour l'enseignant
            List<Resultat> resultats = resultatDAO.findResultatByEnseignant(enseignantEmail);
            resultats.forEach(resultat -> System.out.println("Résultat : " +
                    resultat.getEtudiant().getNom() + " - " +
                    resultat.getCours().getNom() + " - " +
                    resultat.getNote()));

            System.out.println("Nombre de résultats : " + resultats.size());

            // Passage des résultats au modèle pour la JSP
            model.addAttribute("resultats", resultats);

            return "Enseignant/listResultatsEnseignant"; // Correspond à /WEB-INF/jsp/Enseignant/listResultatsEnseignant.jsp

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/error"; // Rediriger vers une page d'erreur
        }
    }
}
