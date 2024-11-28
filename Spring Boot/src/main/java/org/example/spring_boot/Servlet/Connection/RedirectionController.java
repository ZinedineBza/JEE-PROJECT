package org.example.spring_boot.Servlet.Connection;
import jakarta.servlet.http.HttpSession;
import org.example.spring_boot.Modele.Cour;
import org.example.spring_boot.Modele.DAO.CoursRepository;
import org.example.spring_boot.Modele.Utilisateur;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Objects;

@Controller
public class RedirectionController {

    private final CoursRepository coursDAO;

    // Injection du DAO (Spring gère la création et la gestion des beans automatiquement)
    public RedirectionController(CoursRepository coursDAO) {
        this.coursDAO = coursDAO;
    }

    @GetMapping("/redirection")
    public String handleRedirection(HttpSession session, Model model) {
        // Récupérer l'utilisateur connecté depuis la session
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("user");

        // Vérifier si l'utilisateur est connecté
        if (utilisateur == null) {
            // Redirection vers la page de connexion avec une erreur
            return "redirect:/?error=notLoggedIn";
        }

        // Récupérer le rôle de l'utilisateur
        String role = utilisateur.getRole();

        // Redirection en fonction du rôle
        if (Objects.equals(role, "admin")) {
            // Redirection pour les administrateurs
            return "Admin/Main"; // Renvoie vers /WEB-INF/jsp/Admin/Main.jsp

        } else if (Objects.equals(role, "enseignant")) {
            // Récupérer les cours associés à l'enseignant
            List<Cour> coursEtudiant = coursDAO.findByUtilisateur(utilisateur.getEmail());
            model.addAttribute("coursEtudiant", coursEtudiant);

            // Redirection pour les enseignants
            return "Enseignant/index"; // Renvoie vers /WEB-INF/jsp/Enseignant/index.jsp

        } else if (Objects.equals(role, "etudiant")) {
            // Récupérer les cours associés à l'étudiant
            List<Cour> coursEtudiant = coursDAO.findByUtilisateur(utilisateur.getEmail());
            model.addAttribute("coursEtudiant", coursEtudiant);

            // Redirection pour les étudiants
            return "Etudiant/index"; // Renvoie vers /WEB-INF/jsp/Etudiant/index.jsp

        } else {
            // Gestion des rôles non prévus
            return "redirect:/?error=unknownRole";
        }
    }
}
