package org.example.spring_boot.Servlet.Etudiant;
import jakarta.servlet.http.HttpSession;
import org.example.spring_boot.Modele.DAO.UtilisateurRepository;
import org.example.spring_boot.Modele.Utilisateur;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class SelectStudentController {

    private final UtilisateurRepository utilisateurDAO;

    public SelectStudentController(UtilisateurRepository utilisateurDAO) {
        this.utilisateurDAO = utilisateurDAO;
    }

    // Gestion des requêtes GET pour afficher les étudiants
    @GetMapping("/etudiant/selectStudent")
    public String showStudents(Model model) {
        // Récupérer uniquement les utilisateurs ayant le rôle "ETUDIANT"
        List<Utilisateur> etudiants = utilisateurDAO.findByRole("ETUDIANT");

        // Ajouter les étudiants au modèle pour la vue JSP
        model.addAttribute("etudiants", etudiants);

        return "Etudiant/selectStudent"; // Correspond à /WEB-INF/jsp/Etudiant/selectStudent.jsp
    }

    // Gestion des requêtes POST pour sélectionner un étudiant
    @PostMapping("/etudiant/selectStudent")
    public String selectStudent(
            @RequestParam("etudiantEmail") String etudiantEmail,
            HttpSession session) {

        // Stocker l'email de l'étudiant dans la session
        session.setAttribute("etudiantEmail", etudiantEmail);

        // Rediriger vers la page des résultats
        return "redirect:/etudiant/studentResults";
    }
}
