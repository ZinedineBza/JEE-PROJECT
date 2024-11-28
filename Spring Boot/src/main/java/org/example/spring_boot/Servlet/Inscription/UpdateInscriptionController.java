package org.example.spring_boot.Servlet.Inscription;
import jakarta.servlet.http.HttpSession;
import jeeprojet.application.Modele.Inscription;
import org.example.spring_boot.Modele.DAO.InscriptionRepository;
import org.example.spring_boot.Modele.InscriptionId;
import org.example.spring_boot.Modele.Matiere;
import org.example.spring_boot.Modele.Utilisateur;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class UpdateInscriptionController {

    private final InscriptionRepository inscriptionDAO;

    public UpdateInscriptionController(InscriptionRepository inscriptionDAO) {
        this.inscriptionDAO = inscriptionDAO;
    }

    @PostMapping("/inscriptions/update")
    public String updateInscription(
            @RequestParam("date") String date,
            @RequestParam("etudiantEmail") String etudiantEmail,
            @RequestParam("coursId") String coursId,
            HttpSession session,
            Model model) {

        // Récupérer l'utilisateur connecté
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("user");

        if (utilisateur == null || !"admin".equals(utilisateur.getRole())) {
            model.addAttribute("error", "Vous n'êtes pas autorisé à effectuer cette opération.");
            return "error"; // Vue pour afficher une erreur d'accès
        }

        // Création de l'ID d'inscription
        InscriptionId id = new InscriptionId();
        id.setDateInscription(date);
        id.setEtudiant(etudiantEmail);

        // Récupérer l'inscription à partir de l'ID
       Optional<Inscription> inscription = inscriptionDAO.findById(id);
        Utilisateur etudiant = inscriptionDAO.findUtilisateurByEmail(etudiantEmail);
        Matiere cours = inscriptionDAO.findCoursById(coursId);

        if (inscription.isPresent() && etudiant != null && cours != null) {
            id.setMatiere(cours.getNom());
            inscription.get().setEtudiant(etudiant);

            // Mettre à jour l'inscription
            inscriptionDAO.update(inscription);

            return "redirect:/inscriptions"; // Rediriger vers la liste des inscriptions
        } else {
            model.addAttribute("error", "Impossible de mettre à jour l'inscription.");
            return "editInscription"; // Vue pour afficher le formulaire d'édition avec une erreur
        }
    }
}
