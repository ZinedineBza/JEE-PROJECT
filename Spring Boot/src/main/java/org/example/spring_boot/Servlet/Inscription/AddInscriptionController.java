package org.example.spring_boot.Servlet.Inscription;
import jeeprojet.application.Modele.Inscription;
import org.example.spring_boot.Modele.DAO.InscriptionRepository;
import org.example.spring_boot.Modele.DAO.MatiereRepository;
import org.example.spring_boot.Modele.InscriptionId;
import org.example.spring_boot.Modele.Matiere;
import org.example.spring_boot.Modele.Utilisateur;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

@Controller
public class AddInscriptionController {

    private final InscriptionRepository inscriptionDAO;
    private final MatiereRepository matiereDAO;

    public AddInscriptionController(InscriptionRepository inscriptionDAO, MatiereRepository matiereDAO) {
        this.inscriptionDAO = inscriptionDAO;
        this.matiereDAO = matiereDAO;
    }

    // Gestion des requêtes GET pour afficher le formulaire d'inscription
    @GetMapping("/etudiant/addInscription")
    public String showAddInscriptionPage(Model model) {
        // Récupérer la liste des matières depuis la base de données
        List<Matiere> coursList = matiereDAO.findAll();
        model.addAttribute("coursList", coursList);

        return "Etudiant/addInscription"; // Correspond à /WEB-INF/jsp/Etudiant/addInscription.jsp
    }

    // Gestion des requêtes POST pour ajouter une inscription
    @PostMapping("/etudiant/addInscription")
    public String addInscription(
            @RequestParam("etudiantEmail") String etudiantEmail,
            @RequestParam("coursId") String matiereId,
            Model model) {

        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String dateInscription = currentDate.format(formatter);

        Map<String, String> errors = new HashMap<>();

        // Récupérer l'étudiant et la matière
        Utilisateur etudiant = inscriptionDAO.findUtilisateurByEmail(etudiantEmail);
        Matiere cours = inscriptionDAO.findCoursById(matiereId);

        if (etudiant == null || cours == null) {
            model.addAttribute("error", "Étudiant ou matière introuvable.");
            return "redirect:/etudiant/addInscription";
        }

        // Vérifier si l'élève est déjà inscrit à cette matière
        if (inscriptionDAO.isAlreadyEnrolled(etudiantEmail, cours.getNom())) {
            model.addAttribute("error", "L'élève est déjà inscrit à cette matière.");
            model.addAttribute("coursList", matiereDAO.findAll());
            return "Etudiant/addInscription";
        }

        // Créer l'ID d'inscription
        InscriptionId id = new InscriptionId();
        id.setEtudiant(etudiantEmail);
        id.setDateInscription(dateInscription);
        id.setMatiere(cours.getNom());

        // Créer une nouvelle inscription
        Inscription inscription = new Inscription();
        inscription.setEtudiant(etudiant);
        inscription.setId(id);
        inscription.setMatiere(cours);

        // Sauvegarder l'inscription
        inscriptionDAO.save(inscription);

        // Rediriger vers la liste des inscriptions
        return "redirect:/etudiant/listInscriptions"; // Assurez-vous que cette route existe
    }
}
