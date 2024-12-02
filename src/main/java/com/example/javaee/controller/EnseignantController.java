package com.example.javaee.controller;

import com.example.javaee.Enseignant.EmailService;
import com.example.javaee.model.*;
import com.example.javaee.repository.InscriptionRepository;
import com.example.javaee.repository.MatiereRepository;
import com.example.javaee.repository.ResultatRepository;
import com.example.javaee.repository.UtilisateurRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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


    @GetMapping("/editInscription")
    public String showEditForm(@RequestParam("id") String id, Model model) {
        try {
            InscriptionId inscriptionId = parseInscriptionId(id);
            Inscription inscription = inscriptionRepository.findById(inscriptionId).orElse(null);

            if (inscription == null) {
                model.addAttribute("error", "Inscription introuvable.");
                return "redirect:/ListInscriptionServlet";
            }

            model.addAttribute("inscription", inscription);
            model.addAttribute("etudiants", utilisateurRepository.findByRole("ETUDIANT"));
            model.addAttribute("matieres", matiereRepository.findAll());
            return "Enseignant/editInscription";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            return "redirect:/ListInscriptionServlet";
        }
    }


    @PostMapping("/editInscription")
    public String editInscription(
            @RequestParam("id") String id,
            @RequestParam("matiere") String matiereNom,
            @RequestParam("etudiant") String etudiantEmail,
            RedirectAttributes redirectAttributes) {

        // Convertir l'ID composite en objet InscriptionId
        InscriptionId inscriptionId = parseInscriptionId(id);

        // Récupérer l'inscription existante
        Inscription inscription = inscriptionRepository.findById(inscriptionId).orElse(null);

        if (inscription == null) {
            redirectAttributes.addFlashAttribute("error", "Inscription introuvable.");
            return "redirect:/ListInscriptionServlet";
        }

        // Récupérer la nouvelle matière et le nouvel étudiant
        Matiere matiere = matiereRepository.findById(matiereNom).orElse(null);
        Utilisateur etudiant = utilisateurRepository.findById(etudiantEmail).orElse(null);

        if (matiere == null || etudiant == null) {
            redirectAttributes.addFlashAttribute("error", "Étudiant ou matière invalide.");
            return "redirect:/ListInscriptionServlet";
        }

        // Supprimer l'inscription existante
        inscriptionRepository.delete(inscription);

        // Créer une nouvelle inscription avec les nouvelles valeurs
        Inscription newInscription = new Inscription();
        InscriptionId newId = new InscriptionId();
        newId.setDateInscription(inscriptionId.getDateInscription()); // Conserver la date originale
        newId.setEtudiant(etudiant.getEmail());
        newId.setMatiere(matiere.getNom());
        newInscription.setId(newId);
        newInscription.setEtudiant(etudiant);
        newInscription.setMatiere(matiere);

        // Sauvegarder la nouvelle inscription
        inscriptionRepository.save(newInscription);

        redirectAttributes.addFlashAttribute("success", "Inscription modifiée avec succès.");
        return "redirect:/ListInscriptionServlet";
    }


    // Suppression d'une inscription
    @GetMapping("/deleteInscription")
    public String deleteInscription(@RequestParam("id") String id, RedirectAttributes redirectAttributes) {
        try {
            InscriptionId inscriptionId = parseInscriptionId(id);
            Inscription inscription = inscriptionRepository.findById(inscriptionId).orElse(null);

            if (inscription == null) {
                redirectAttributes.addFlashAttribute("error", "Inscription introuvable.");
                return "redirect:/ListInscriptionServlet";
            }

            inscriptionRepository.delete(inscription);
            redirectAttributes.addFlashAttribute("success", "Inscription supprimée avec succès.");
            return "redirect:/ListInscriptionServlet";
        } catch (IllegalArgumentException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/ListInscriptionServlet";
        }
    }


    // Méthode utilitaire pour convertir un String en InscriptionId
    private InscriptionId parseInscriptionId(String id) {
        if (id == null || !id.contains("_")) {
            throw new IllegalArgumentException("ID invalide ou manquant.");
        }

        String[] parts = id.split("_");
        if (parts.length != 3) {
            throw new IllegalArgumentException("ID invalide. Format attendu : dateInscription_etudiant_matiere.");
        }

        InscriptionId inscriptionId = new InscriptionId();
        inscriptionId.setDateInscription(parts[0]);
        inscriptionId.setEtudiant(parts[1]);
        inscriptionId.setMatiere(parts[2]);

        return inscriptionId;
    }



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

