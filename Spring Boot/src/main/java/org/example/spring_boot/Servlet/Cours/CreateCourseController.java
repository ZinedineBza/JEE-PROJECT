package org.example.spring_boot.Servlet.Cours;
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

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
public class CreateCourseController {

    private final CoursRepository coursDAO;
    private final MatiereRepository matiereDAO;
    private final UtilisateurRepository utilisateurDAO;

    public CreateCourseController(CoursRepository coursDAO, MatiereRepository matiereDAO, UtilisateurRepository utilisateurDAO) {
        this.coursDAO = coursDAO;
        this.matiereDAO = matiereDAO;
        this.utilisateurDAO = utilisateurDAO;
    }

    // Gestion des requêtes GET pour afficher le formulaire
    @GetMapping("/admin/createCourse")
    public String showCreateCoursePage(Model model) {
        // Charger la liste des matières pour le formulaire
        List<Matiere> coursList = matiereDAO.findAll();
        model.addAttribute("coursList", coursList);
        return "Admin/createCourse"; // Renvoie vers /WEB-INF/jsp/Admin/createCourse.jsp
    }

    // Gestion des requêtes POST pour créer un cours
    @PostMapping("/admin/createCourse")
    public String handleCreateCourse(
            @RequestParam("emailProf") String enseignantMail,
            @RequestParam("nom") String nomMatiere,
            @RequestParam("salle") String salle,
            @RequestParam("date") String date,
            @RequestParam("horaire") String horaire,
            Model model) {

        // Initialisation des erreurs
        Map<String, String> errors = new HashMap<>();

        // Vérification de l'enseignant
        Optional<Utilisateur> enseignant = utilisateurDAO.findById(enseignantMail);
        Utilisateur isEnseignant = utilisateurDAO.findByIdEnseignant(enseignantMail);

        if (enseignant.isEmpty()) {
            errors.put("enseignantMail", "L'email renseigné n'est pas attribué. Veuillez réessayer.");
        }
        if (isEnseignant == null) {
            errors.put("enseignantMail", "L'email renseigné n'appartient pas à un enseignant. Veuillez réessayer.");
        }

        // Si des erreurs existent, réafficher le formulaire avec les erreurs
        if (!errors.isEmpty()) {
            model.addAttribute("errors", errors);

            // Repasser les données pour pré-remplir le formulaire
            model.addAttribute("emailProf", enseignantMail);
            model.addAttribute("nom", nomMatiere);
            model.addAttribute("salle", salle);
            model.addAttribute("date", date);
            model.addAttribute("horaire", horaire);

            // Repasser la liste des matières
            List<Matiere> coursList = matiereDAO.findAll();
            model.addAttribute("coursList", coursList);

            return "Admin/createCourse"; // Renvoie vers la même page avec les erreurs
        }

        // Création du cours
        CourId coursId = new CourId();
        coursId.setDate(date);
        coursId.setHoraire(horaire);
        coursId.setEnseignant(enseignantMail);

        Optional<Matiere> matiere = Optional.of(new Matiere());
        matiere.get().setNom(nomMatiere);

        Cour cours = new Cour();
        cours.setId(coursId);
        cours.setEnseignant(enseignant);
        cours.setMatiere(matiere);
        cours.setSalle(salle);

        coursDAO.save(cours);

        // Redirection après succès
        return "redirect:/admin/listCourses"; // Redirige vers la liste des cours
    }
}
