package org.example.spring_boot.Servlet.Cours;
import org.example.spring_boot.Modele.Cour;
import org.example.spring_boot.Modele.DAO.CoursRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class GetCoursesController {

    private final CoursRepository coursDAO;

    public GetCoursesController(CoursRepository coursDAO) {
        this.coursDAO = coursDAO; // Injection du DAO
    }

    @GetMapping("/api/courses")
    public String getCourses(@RequestParam("matiereId") String matiereId) {
        // Récupération des cours par matière
        List<Cour> coursList = coursDAO.findCoursByMatiere(matiereId);

        // Génération de la réponse HTML
        StringBuilder htmlResponse = new StringBuilder();
        for (Cour cours : coursList) {
            htmlResponse.append("<tr>")
                    .append("<td>").append(cours.getMatiere()).append("</td>")
                    .append("<td>").append(cours.getEnseignant().getNom()).append("</td>")
                    .append("<td><button class='emploi-du-temps-btn' data-email='")
                    .append(cours.getEnseignant().getEmail())
                    .append("'>Voir emploi du temps</button></td>")
                    .append("</tr>");
        }
        return htmlResponse.toString();
    }
}
