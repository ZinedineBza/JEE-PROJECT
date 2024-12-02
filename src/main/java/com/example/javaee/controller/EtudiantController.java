package com.example.javaee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.apache.catalina.manager.util.SessionUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.javaee.config.PasswordGenerator;
import com.example.javaee.model.Cour;
import com.example.javaee.model.CourId;
import com.example.javaee.model.Inscription;
import com.example.javaee.model.InscriptionId;
import com.example.javaee.model.Matiere;
import com.example.javaee.model.Resultat;
import com.example.javaee.model.ResultatId;
import com.example.javaee.model.ResultatParMatiere;
import com.example.javaee.model.Utilisateur;

import com.example.javaee.repository.*;

import jakarta.servlet.http.HttpSession;
@Controller
public class EtudiantController {

    private final UtilisateurRepository utilisateurRepository;
    private final PasswordEncoder passwordEncoder;
    private final InscriptionRepository inscriptionRepository;
    private final MatiereRepository matiereRepository;
    private final ResultatRepository resultatRepository;
    private final CoursRepository coursRepository;

    public EtudiantController(UtilisateurRepository utilisateurRepository, 
                           PasswordEncoder passwordEncoder, 
                           InscriptionRepository inscriptionRepository, 
                           MatiereRepository matiereRepository, ResultatRepository resultatRepository, 
                           CoursRepository coursRepository) {
        this.utilisateurRepository = utilisateurRepository;
        this.passwordEncoder = passwordEncoder;
        this.inscriptionRepository = inscriptionRepository;
        this.matiereRepository = matiereRepository;
        this.resultatRepository = resultatRepository;
        this.coursRepository = coursRepository;
    }


    // Page d'accueil de l'étudiant
    @GetMapping("/etudiant")
    public String emploiDuTemps( Model model) { 
        return "etudiant/etudiant";  // Retourner la page de l'emploi du temps
    }
    
    public static Utilisateur getUtilisateurFromSession(HttpSession session) {
        return (Utilisateur) session.getAttribute("user");
    }

@GetMapping("/etudiant/manage-inscriptionEtudiant")
public String manageInscriptionEtudiant(Model model, HttpSession session, Authentication authentication) {
    // Étape 1 : Vérifier l'utilisateur dans la session
    Utilisateur utilisateur = getUtilisateurFromSession(session);
    System.out.println("Utilisateur dans la session : " + utilisateur);
    if (utilisateur == null) {
        // Si l'utilisateur n'est pas dans la session, tenter de récupérer depuis Authentication
        if (authentication == null || !authentication.isAuthenticated()) {
            return "redirect:/login"; // Rediriger vers la page de connexion si non connecté
        }

        Object principal = authentication.getPrincipal();
        String email = null;

        if (principal instanceof UserDetails) {
            // Si l'utilisateur connecté est un UserDetails
            email = ((UserDetails) principal).getUsername(); // Récupérer l'email
        } else if (principal instanceof String) {
            email = (String) principal; // Utilisateur sous forme de chaîne
        }

        if (email == null) {
            return "redirect:/login"; // Rediriger si aucune information utilisateur n'est disponible
        }

        // Étape 2 : Rechercher l'utilisateur dans la base de données
        utilisateur = utilisateurRepository.findByEmail(email);
        if (utilisateur == null || !"ETUDIANT".equals(utilisateur.getRole())) {
            return "redirect:/login"; // Rediriger si l'utilisateur n'est pas un étudiant
        }

        // Ajouter l'utilisateur dans la session
        session.setAttribute("user", utilisateur);
    }

    // Étape 3 : Récupérer les inscriptions de l'étudiant
    List<Inscription> inscriptions = inscriptionRepository.findByEtudiantEmail(utilisateur.getEmail());
    System.out.println("Inscriptions pour l'utilisateur connecté : " + inscriptions);

    // Étape 4 : Ajouter les données au modèle
    model.addAttribute("etudiants", utilisateurRepository.findByEmail(utilisateur.getEmail()));
    model.addAttribute("inscriptions", inscriptions);
    model.addAttribute("matieres", matiereRepository.findAll());

    // Étape 5 : Retourner la vue pour la gestion des inscriptions
    return "/etudiant/manage-inscriptionEtudiant";
}

    
@PostMapping("/etudiant/add-inscriptionEtudiant")
public String addInscription(
        @RequestParam("etudiant") String emailEtudiant,
        @RequestParam("matiere") String nomCours,
        RedirectAttributes redirectAttributes,
        HttpSession session) {

    // Étape 1 : Récupérer l'utilisateur connecté depuis la session
    Utilisateur utilisateur = (Utilisateur) session.getAttribute("user");
    System.out.println("Utilisateur connecté : " + utilisateur);

    // Vérifier que l'utilisateur est connecté et correspond à l'email fourni
    if (utilisateur == null || !"ETUDIANT".equals(utilisateur.getRole()) || !emailEtudiant.equals(utilisateur.getEmail())) {
        redirectAttributes.addFlashAttribute("error", "Action non autorisée. Veuillez vous reconnecter.");
        return "redirect:/login"; // Rediriger vers la page de connexion si non connecté
    }

    // Validation des données d'entrée
    if (emailEtudiant == null || emailEtudiant.isEmpty() || nomCours == null || nomCours.isEmpty()) {
        redirectAttributes.addFlashAttribute("error", "Veuillez fournir tous les champs obligatoires.");
        return "redirect:/etudiant/manage-inscriptionEtudiant";
    }

    try {
        // Étape 2 : Récupérer le cours à partir de son nom
        List<Matiere> matieres = matiereRepository.findByNomContaining(nomCours);
        if (matieres.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Cours non trouvé. Veuillez vérifier le nom du cours.");
            return "redirect:/etudiant/manage-inscriptionEtudiant";
        }
        Matiere matiere = matieres.get(0); // Prendre le premier résultat correspondant

        // Étape 3 : Vérifier si une inscription existe déjà
        InscriptionId inscriptionId = new InscriptionId();
        inscriptionId.setDateInscription(LocalDate.now().toString());
        inscriptionId.setEtudiant(emailEtudiant);
        inscriptionId.setMatiere(matiere.getNom());

        Optional<Inscription> existingInscription = inscriptionRepository.findById(inscriptionId);

        if (existingInscription.isPresent()) {
            redirectAttributes.addFlashAttribute("error", "Vous êtes déjà inscrit à ce cours.");
            return "redirect:/etudiant/manage-inscriptionEtudiant";
        }

        // Étape 4 : Créer une nouvelle inscription
        Inscription inscription = new Inscription();
        InscriptionId newInscriptionId = new InscriptionId();
        newInscriptionId.setEtudiant(emailEtudiant);
        newInscriptionId.setMatiere(matiere.getNom());
        newInscriptionId.setDateInscription(LocalDate.now().toString()); // Date d'inscription
        inscription.setId(newInscriptionId);
        inscription.setEtudiant(utilisateur);
        inscription.setMatiere(matiere);

        // Étape 5 : Enregistrer l'inscription
        inscriptionRepository.save(inscription);

        // Ajouter un message de succès
        redirectAttributes.addFlashAttribute("message", "Inscription ajoutée avec succès.");
    } catch (Exception e) {
        // Gérer les erreurs
        redirectAttributes.addFlashAttribute("error", "Erreur lors de l'ajout de l'inscription : " + e.getMessage());
        e.printStackTrace();
    }

    // Rediriger vers la gestion des inscriptions
    return "redirect:/etudiant/manage-inscriptionEtudiant";
}
    
    // Page de gestion des notes de l'étudiant
    @GetMapping("/etudiant/manage-resultatEtudiant")
    public String listStudentResults(HttpSession session, Model model) {
        // Récupérer l'utilisateur connecté depuis la session
        Utilisateur etudiant = getUtilisateurFromSession(session);
        System.out.println("Utilisateur vazdzaconnecté : " + etudiant);
        if (etudiant == null) {
            model.addAttribute("error", "Utilisateur non connecté");
            return "redirect:/login"; // Rediriger vers la page de connexion si aucun utilisateur n'est trouvé
        }
        
        String email = etudiant.getEmail(); // Récupérer l'email de l'utilisateur
    
        // Récupérer les résultats associés à cet étudiant
        List<Resultat> results = resultatRepository.findByEtudiant_Email(email);
    
        // Organiser les résultats par matière et calculer la moyenne par matière
        Map<String, List<Resultat>> resultatsParMatiere = results.stream()
            .collect(Collectors.groupingBy(resultat -> resultat.getCours().getNom()));
    
        // Calculer la moyenne générale de l'étudiant
        double moyenneGenerale = results.stream()
            .mapToDouble(Resultat::getNote)
            .average()
            .orElse(0.0);
    
        // Calculer les moyennes par matière
        List<ResultatParMatiere> resultatsAvecMoyennes = new ArrayList<>();
        for (Map.Entry<String, List<Resultat>> entry : resultatsParMatiere.entrySet()) {
            String matiere = entry.getKey();
            List<Resultat> resultatsDeMatiere = entry.getValue();
            double moyenneMatiere = resultatsDeMatiere.stream()
                .mapToDouble(Resultat::getNote)
                .average()
                .orElse(0.0);
    
            resultatsAvecMoyennes.add(new ResultatParMatiere(matiere, moyenneMatiere, resultatsDeMatiere));
        }
    
        // Ajouter les données au modèle
        model.addAttribute("etudiant", etudiant);
        model.addAttribute("resultatsParMatiere", resultatsAvecMoyennes);
        model.addAttribute("moyenneGenerale", moyenneGenerale);
        model.addAttribute("notesVides", results.isEmpty());
    
        return "/etudiant/manage-resultatEtudiant"; // Retourner la page des résultats
    }
    

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();  // Déconnecter l'utilisateur
        return "redirect:/login";  // Redirection vers la page de connexion
    }
}
