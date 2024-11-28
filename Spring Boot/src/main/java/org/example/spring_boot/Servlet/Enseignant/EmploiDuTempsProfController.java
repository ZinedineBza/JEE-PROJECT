package org.example.spring_boot.Servlet.Enseignant;
import org.example.spring_boot.Modele.Cour;
import org.example.spring_boot.Modele.DAO.CoursRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class EmploiDuTempsProfController {

    private final CoursRepository coursDAO;

    public EmploiDuTempsProfController(CoursRepository coursDAO) {
        this.coursDAO = coursDAO;
    }

    @GetMapping("/admin/emploiDuTempsProf")
    public String getEmploiDuTempsProf(@RequestParam("email") String profEmail, Model model) {
        // Récupérer les cours de l'enseignant à partir de son email
        List<Cour> cours = coursDAO.findByUtilisateur(profEmail);

        // Ajouter les cours au modèle pour les passer à la JSP
        model.addAttribute("cours", cours);

        // Retourner la vue (fichier JSP)
        return "Admin/modifCours"; // Correspond à /WEB-INF/jsp/Admin/modifCours.jsp
    }
}
