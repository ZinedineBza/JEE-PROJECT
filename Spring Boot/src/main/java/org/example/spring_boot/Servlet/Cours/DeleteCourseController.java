package org.example.spring_boot.Servlet.Cours;
import jakarta.servlet.http.HttpSession;
import org.example.spring_boot.Modele.Cour;
import org.example.spring_boot.Modele.CourId;
import org.example.spring_boot.Modele.DAO.CoursRepository;
import org.example.spring_boot.Modele.Utilisateur;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.Objects;
import java.util.Optional;

@Controller
public class DeleteCourseController {

    private final CoursRepository coursDAO;

    public DeleteCourseController(CoursRepository coursDAO) {
        this.coursDAO = coursDAO; // Injection du DAO via le constructeur
    }

    @PostMapping("/admin/deleteCourse")
    public String deleteCourse(
            @RequestParam("enseignantEmail") String enseignantEmail,
            @RequestParam("date") String date,
            @RequestParam("horaire") String horaire,
            HttpSession session) {

        // Récupérer l'utilisateur connecté depuis la session
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("user");

        // Vérifier si l'utilisateur est un administrateur
        if (utilisateur != null && Objects.equals(utilisateur.getRole(), "admin")) {

            // Création de l'ID composite pour identifier le cours
            CourId courId = new CourId();
            courId.setEnseignant(enseignantEmail);
            courId.setDate(date);
            courId.setHoraire(horaire);

            // Recherche du cours avec l'ID composite
            Optional<Cour> cours = coursDAO.findById(courId);

            if (cours.isPresent()) {
                // Si le cours est trouvé, on le supprime
                coursDAO.delete(cours);
            }
        }

        // Redirection vers la liste des matières après suppression
        return "redirect:/admin/getMatiere"; // Correspond à la route de la liste des matières
    }
}
