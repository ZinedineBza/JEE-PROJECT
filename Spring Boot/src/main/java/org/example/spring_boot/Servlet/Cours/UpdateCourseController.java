package org.example.spring_boot.Servlet.Cours;
import jakarta.servlet.http.HttpSession;
import org.example.spring_boot.Modele.Cour;
import org.example.spring_boot.Modele.CourId;
import org.example.spring_boot.Modele.DAO.CoursRepository;
import org.example.spring_boot.Modele.DAO.MatiereRepository;
import org.example.spring_boot.Modele.DAO.UtilisateurRepository;
import org.example.spring_boot.Modele.Matiere;
import org.example.spring_boot.Modele.Utilisateur;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.Objects;
import java.util.Optional;

@Controller
public class UpdateCourseController {

    private final CoursRepository coursDAO;
    private final MatiereRepository matiereDAO;
    private final UtilisateurRepository utilisateurDAO;

    public UpdateCourseController(CoursRepository coursDAO, MatiereRepository matiereDAO, UtilisateurRepository utilisateurDAO) {
        this.coursDAO = coursDAO;
        this.matiereDAO = matiereDAO;
        this.utilisateurDAO = utilisateurDAO;
    }

    // Gestion des requêtes GET pour afficher le formulaire de mise à jour
    @GetMapping("/admin/updateCourse")
    public String showUpdateCoursePage(
            @RequestParam("enseignantEmail") String enseignantEmail,
            @RequestParam("nomMatiere") String nomMatiere,
            @RequestParam("date") String date,
            @RequestParam("horaire") String horaire,
            Model model) {

        // Identifier le cours à partir des paramètres
        CourId courId = new CourId();
        courId.setEnseignant(enseignantEmail);
        courId.setDate(date);
        courId.setHoraire(horaire);

        // Charger les informations du cours
        Optional<Cour> cours = coursDAO.findById(courId);
        model.addAttribute("cours", cours);

        return "Admin/updateCourse"; // Renvoie vers /WEB-INF/jsp/Admin/updateCourse.jsp
    }

    // Gestion des requêtes POST pour mettre à jour un cours
    @PostMapping("/admin/updateCourse")
    public String updateCourse(
            @RequestParam("enseignant") String enseignantEmail,
            @RequestParam("matiere") String nomMatiere,
            @RequestParam("date") String date,
            @RequestParam("horaireancienne") String horaireancienne,
            @RequestParam("dateancienne") String dateancienne,
            @RequestParam("horaire") String horaire,
            @RequestParam("salle") String salle,
            HttpSession session) {

        // Récupérer l'utilisateur connecté
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("user");

        // Identifier l'ancien cours
        CourId ancienCourId = new CourId();
        ancienCourId.setEnseignant(enseignantEmail);
        ancienCourId.setDate(dateancienne);
        ancienCourId.setHoraire(horaireancienne);

        // Identifier le nouveau cours
        CourId courId = new CourId();
        courId.setEnseignant(enseignantEmail);
        courId.setDate(date);
        courId.setHoraire(horaire);

        // Vérifier si l'utilisateur est un administrateur
        if (utilisateur != null && Objects.equals(utilisateur.getRole(), "admin")) {
            // Récupérer les informations nécessaires
            Optional<Cour> ancienCours = coursDAO.findById(ancienCourId);
            Optional<Matiere> matiere = matiereDAO.findById(nomMatiere);
            Optional<Utilisateur> enseignant = utilisateurDAO.findById(enseignantEmail);

            // Supprimer l'ancien cours
            if (ancienCours.isPresent()) {
                coursDAO.delete(ancienCours);
            }

            // Créer un nouveau cours avec les informations mises à jour
            Cour nouveauCours = new Cour();
            nouveauCours.setId(courId);
            nouveauCours.setMatiere(matiere);
            nouveauCours.setSalle(salle);
            nouveauCours.setEnseignant(enseignant.orElse(null));

            // Enregistrer le nouveau cours
            coursDAO.save(nouveauCours);
        }

        // Redirection après mise à jour
        return "redirect:/admin/getMatiere"; // Renvoie vers la liste des matières
    }
}
