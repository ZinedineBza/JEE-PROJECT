package org.example.spring_boot.Servlet.Matiere;
import jakarta.servlet.http.HttpSession;
import org.example.spring_boot.Modele.DAO.MatiereRepository;
import org.example.spring_boot.Modele.Matiere;
import org.example.spring_boot.Modele.Utilisateur;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class GetMatieresController {

    private final MatiereRepository matiereDAO;

    public GetMatieresController(MatiereRepository matiereDAO) {
        this.matiereDAO = matiereDAO;
    }

    @GetMapping("/admin/matieres")
    public String getMatieres(HttpSession session, Model model) {
        // Récupérer l'utilisateur connecté depuis la session
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("user");

        // Vérifier le rôle de l'utilisateur
        if (utilisateur == null || !"admin".equals(utilisateur.getRole())) {
            model.addAttribute("errorMessage", "Accès non autorisé");
            return "error"; // Vue pour afficher une erreur d'accès
        }

        // Récupérer la liste des matières pour les administrateurs
        List<Matiere> matieres = matiereDAO.findAll();
        model.addAttribute("matieres", matieres);

        return "Admin/listCourses"; // Correspond à /WEB-INF/jsp/Admin/listCourses.jsp
    }
}
