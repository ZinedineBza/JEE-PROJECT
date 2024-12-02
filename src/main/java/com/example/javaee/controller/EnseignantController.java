package com.example.javaee.controller;

import com.example.javaee.Enseignant.EmailService;
import com.example.javaee.model.*;
import com.example.javaee.repository.InscriptionRepository;
import com.example.javaee.repository.MatiereRepository;
import com.example.javaee.repository.ResultatRepository;
import com.example.javaee.repository.UtilisateurRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class EnseignantController {

    @Autowired
    private InscriptionRepository inscriptionRepository;

    @Autowired
    private UtilisateurRepository utilisateurRepository;

    @Autowired
    private MatiereRepository matiereRepository;

    @Autowired
    private ResultatRepository resultatRepository;

    @Autowired
    private EmailService emailService; // Service pour l'envoi d'emails

    @GetMapping("/addResultat")
    public String showAddResultatForm(Model model) {
        // Récupérer la liste des étudiants et des matières
        List<Utilisateur> etudiants = utilisateurRepository.findByRole("ETUDIANT");
        List<Matiere> matieres = matiereRepository.findAll();

        model.addAttribute("etudiants", etudiants);
        model.addAttribute("matieres", matieres);

        System.out.println("[AddResultatController] Affichage du formulaire d'ajout de résultat.");
        return "Enseignant/addResultat"; // Chemin relatif au sous-dossier correct
    }

    /**
     * Gère la soumission du formulaire pour ajouter un nouveau résultat.
     * URL : POST /addResultat
     */
    @PostMapping("/addResultat")
    public String addResultat(
            @RequestParam("etudiant") String fullName,
            @RequestParam("cours") String coursId,
            @RequestParam("note") Float note,
            @RequestParam(value = "commentaire", required = false) String commentaire,
            @RequestParam("date") String date,
            RedirectAttributes redirectAttributes) {

        System.out.println("[AddResultatController] Soumission du formulaire d'ajout de résultat.");

        // Validation des paramètres
        if (fullName == null || coursId == null || note == null) {
            System.out.println("[AddResultatController] Paramètres obligatoires manquants.");
            redirectAttributes.addFlashAttribute("error", "Erreur : Les paramètres obligatoires sont manquants.");
            return "redirect:/addResultat";
        }

        // Récupérer l'étudiant par son prénom et nom combinés
        Utilisateur etudiant = utilisateurRepository.findByFullName(fullName);
        if (etudiant == null) {
            System.out.println("[AddResultatController] Étudiant non trouvé pour le nom complet : " + fullName);
            redirectAttributes.addFlashAttribute("error", "Erreur : L'étudiant avec le nom " + fullName + " n'existe pas.");
            return "redirect:/addResultat";
        }

        // Récupérer le cours
        Matiere cours = matiereRepository.findByNom(coursId).stream().findFirst().orElse(null);
        if (cours == null) {
            System.out.println("[AddResultatController] Cours non trouvé : " + coursId);
            redirectAttributes.addFlashAttribute("error", "Erreur : Le cours n'existe pas.");
            return "redirect:/addResultat";
        }

        // Créer un identifiant composite pour le résultat
        ResultatId id = new ResultatId();
        id.setEtudiant(etudiant.getEmail()); // Utilisez l'e-mail comme identifiant
        id.setMatiere(cours.getNom());
        id.setDate(date);

        // Créer et sauvegarder le résultat
        Resultat resultat = new Resultat();
        resultat.setId(id);
        resultat.setEtudiant(etudiant);
        resultat.setCours(cours);
        resultat.setNote(note);
        resultat.setCommentaire(commentaire);
        resultatRepository.save(resultat);

        System.out.println("[AddResultatController] Résultat sauvegardé pour l'étudiant : " + etudiant.getNom() + " " + etudiant.getPrenom());

        // Envoyer un e-mail
        try {
            emailService.sendResultatEmail(etudiant.getEmail(), cours.getNom(), note);
        } catch (Exception e) {
            System.err.println("[AddResultatController] Erreur lors de l'envoi de l'e-mail : " + e.getMessage());
        }

        // Rediriger avec un message de succès
        redirectAttributes.addFlashAttribute("success", "Résultat ajouté avec succès.");
        return "redirect:/listResultats";
    }



    /**
     * Affiche la liste des résultats.
     * URL : GET /listResultats
     */
    @GetMapping("/listResultats")
    public String listResultats(Model model) {
        List<Resultat> resultats = resultatRepository.findAll();
        model.addAttribute("resultats", resultats);
        System.out.println("[AddResultatController] Affichage de la liste des résultats.");
        return "Enseignant/listResultat"; // Chemin relatif au sous-dossier
    }

    public EnseignantController(UtilisateurRepository utilisateurRepository, InscriptionRepository inscriptionRepository) {
        this.utilisateurRepository = utilisateurRepository;
        this.inscriptionRepository = inscriptionRepository;
    }
    @GetMapping("/ListInscriptionServlet")
    public String listInscriptions(HttpSession session, Model model) {
        // Récupérer l'utilisateur dans la session
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");

        if (utilisateur == null) {
            System.out.println("[EnseignantController] Aucun utilisateur trouvé dans la session. Redirection vers la page de connexion.");
            return "redirect:/";
        }

        // Récupérer les inscriptions selon le rôle
        List<Inscription> inscriptions;
        System.out.println("AAAAAAAAAAAAAAAAAAAA" + utilisateur.getRole());
        switch (utilisateur.getRole()) {
            case "ADMIN":
                inscriptions = inscriptionRepository.findAll();
                break;
            case "ENSEIGNANT":
                System.out.println("Mon chibre"+ utilisateur.getEmail());

                inscriptions = inscriptionRepository.findByEnseignantEmail(utilisateur.getEmail());
                System.out.println("OUIOUI" + inscriptions);
                break;
            case "ETUDIANT":
                inscriptions = inscriptionRepository.findByEnseignantEmail(utilisateur.getEmail());
                break;
            default:
                return "error/403";
        }

        model.addAttribute("inscriptions", inscriptions);
        return "/enseignant/listInscriptions";
    }



    @GetMapping("/enseignant")
    public String enseignantHomePage() {
        return "/enseignant/enseignant"; // Correspond à templates/enseignant/enseignant.html
    }

    // Gestion des étudiants
    @GetMapping("/enseignant/manage-students")
    public String manageStudentsPage() {
        return "/enseignant/manage-students";
    }

    // Gestion des cours
    @GetMapping("/add-course-material")
    public String addCourseMaterialPage() {
        return "/enseignant/add-course-material";
    }

    // Gestion des cours
    @GetMapping("/view-courses")
    public String viewCoursesPage() {
        return "enseignant/view-courses";
    }

    // Notes des étudiants
    @GetMapping("/student-performance")
    public String studentPerformancePage() {
        return "enseignant/student-performance";
    }
}

