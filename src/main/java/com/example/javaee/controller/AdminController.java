package com.example.javaee.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.javaee.config.PasswordGenerator;
import com.example.javaee.model.*;
import com.example.javaee.repository.*;

@Controller
public class AdminController {

    private final UtilisateurRepository utilisateurRepository;
    private final PasswordEncoder passwordEncoder;
    private final InscriptionRepository inscriptionRepository;
    private final MatiereRepository matiereRepository;
    private final ResultatRepository resultatRepository;
    private final CoursRepository coursRepository;

    public AdminController(UtilisateurRepository utilisateurRepository, 
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

    // Page d'accueil pour l'administrateur
    @GetMapping("/admin")
    public String adminHomePage() {
        return "admin/admin"; // Correspond à templates/admin/admin.html
    }

    // Page pour lister les étudiants
    @GetMapping("/admin/manage-listeEtudiant")
    public String listStudentsPage(Model model) {
        model.addAttribute("etudiants", utilisateurRepository.findByRole("ETUDIANT"));
        return "admin/manage-listeEtudiant";
    }

    // Page pour lister les enseignants
    @GetMapping("/admin/manage-listeEnseignant")
    public String listTeachersPage(Model model) {
        model.addAttribute("enseignants", utilisateurRepository.findByRole("ENSEIGNANT"));
        return "admin/manage-listeEnseignant";
    }

    // Page pour ajouter un étudiant
    @GetMapping("/admin/manage-ajouterEtudiant")
    public String addStudentPage() {
        return "admin/manage-ajouterEtudiant";
    }

    // Page pour ajouter un enseignant
    @GetMapping("/admin/manage-ajouterEnseignant")
    public String addTeacherPage() {
        return "admin/manage-ajouterEnseignant";
    }

    // Traitement pour ajouter un étudiant
    @PostMapping("/admin/add-etudiant")
    public String addStudent(
            @RequestParam String pseudo,
            @RequestParam String email) {
        String rawPassword = PasswordGenerator.generatePassword();
        String encodedPassword = passwordEncoder.encode(rawPassword);

        Utilisateur etudiant = new Utilisateur();
        etudiant.setPseudo(pseudo);
        etudiant.setEmail(email);
        etudiant.setMotDePasse(encodedPassword);
        etudiant.setRole("ETUDIANT");
        utilisateurRepository.save(etudiant);

        System.out.println("Mot de passe généré pour l'étudiant : " + rawPassword);
        return "redirect:/admin/manage-listeEtudiant";
    }

    // Traitement pour ajouter un enseignant
    @PostMapping("/admin/add-enseignant")
    public String addTeacher(
            @RequestParam String pseudo,
            @RequestParam String email) {
        String rawPassword = PasswordGenerator.generatePassword();
        String encodedPassword = passwordEncoder.encode(rawPassword);

        Utilisateur enseignant = new Utilisateur();
        enseignant.setPseudo(pseudo);
        enseignant.setEmail(email);
        enseignant.setMotDePasse(encodedPassword);
        enseignant.setRole("ENSEIGNANT");
        utilisateurRepository.save(enseignant);

        System.out.println("Mot de passe généré pour l'enseignant : " + rawPassword);
        return "redirect:/admin/manage-listeEnseignant";
    }

    // Page pour afficher le formulaire d'ajout d'inscription
    @GetMapping("/admin/manage-inscription")
    public String showAddInscriptionPage(Model model) {
        model.addAttribute("etudiants", utilisateurRepository.findByRole("ETUDIANT"));
        model.addAttribute("matieres", matiereRepository.findAll());
        
        return "admin/manage-inscription";
    }

    // Traitement du formulaire d'ajout d'inscription
    @PostMapping("/admin/add-inscription")
    public String addInscription(@RequestParam String etudiantEmail, @RequestParam String matiereNom) {
        // Recherche de l'étudiant par email
        
        Utilisateur etudiant = utilisateurRepository.findByEmail(etudiantEmail);
        // Recherche de la matière par nom
        Matiere matiere = matiereRepository.findByNom(matiereNom).get(0);
        // Création de l'inscription avec une clé composée
        InscriptionId inscriptionId = new InscriptionId();
        inscriptionId.setDateInscription(LocalDate.now().toString());
        inscriptionId.setEtudiant(etudiant.getPseudo()); // Ou utilisez un autre identifiant unique
        inscriptionId.setMatiere(matiere.getNom());

        Inscription inscription = new Inscription();
        inscription.setId(inscriptionId);
        inscription.setEtudiant(etudiant);
        inscription.setMatiere(matiere);

        // Sauvegarde de l'inscription
        inscriptionRepository.save(inscription);

        // Redirection vers la liste des inscriptions après l'ajout
        return "redirect:/admin/manage-listInscriptions";
    }

    @GetMapping("/admin/manage-listInscriptions")
    public String showListInscriptionsPage(Model model) {
    model.addAttribute("inscriptions", inscriptionRepository.findAll());
    return "admin/manage-listInscriptions";
    }

    // Page pour afficher le formulaire d'ajout de résultat
    @GetMapping("/admin/manage-ajouterResultat")
    public String showAddResultatPage(Model model) {
    // Charger les étudiants et les matières
    model.addAttribute("etudiants", utilisateurRepository.findByRole("ETUDIANT"));
    model.addAttribute("matieres", matiereRepository.findAll());
    return "admin/manage-ajouterResultat"; // Correspond à manage-ajouterResultat.html
    }

    @PostMapping("/admin/add-resultat")
    public String addResultat(@RequestParam String etudiantEmail,
                          @RequestParam String matiereNom,
                          @RequestParam Float note,
                          @RequestParam(required = false) String commentaire,
                          Model model) {
    try {
        // Recherche de l'étudiant par email
        Utilisateur etudiant = utilisateurRepository.findByEmail(etudiantEmail);
        if (etudiant == null) {
            throw new IllegalArgumentException("Étudiant introuvable.");
        }

        // Recherche de la matière par nom
        List<Matiere> matieres = matiereRepository.findByNom(matiereNom);
        if (matieres.isEmpty()) {
            throw new IllegalArgumentException("Matière introuvable.");
        }
        Matiere matiere = matieres.get(0);

        // Création de l'ID de résultat
        ResultatId resultatId = new ResultatId();
        resultatId.setEtudiant(etudiant.getPseudo());
        resultatId.setCours(matiere.getNom());
        resultatId.setDate(LocalDate.now().toString());

        // Création et sauvegarde du résultat
        Resultat resultat = new Resultat();
        resultat.setId(resultatId);
        resultat.setEtudiant(etudiant);
        resultat.setCours(matiere);
        resultat.setNote(note);
        resultat.setCommentaire(commentaire);

        resultatRepository.save(resultat);
        return "redirect:/admin/manage-listResultat";

    } catch (IllegalArgumentException e) {
        // Gérer les erreurs et retourner à la page avec un message
        model.addAttribute("error", e.getMessage());
        model.addAttribute("etudiants", utilisateurRepository.findByRole("ETUDIANT"));
        model.addAttribute("matieres", matiereRepository.findAll());
        return "admin/manage-ajouterResultat";
    }
}

    /*********************** Ajouter, consulter, modifier et supprimer resultat  **********************/
    
    // Page pour afficher la liste des résultats
    @GetMapping("/admin/manage-listResultat")
    public String showListResultatsPage(Model model) {
        model.addAttribute("resultats", resultatRepository.findAll());
        return "admin/manage-listResultat"; // Correspond au fichier manage-listResultat.html
    }

        


    /*********************** Ajouter, consulter, modifier et supprimer cours  **********************/
    
    @GetMapping("/admin/manage-ajouterCours")
    public String showAddCoursPage(Model model) {
        model.addAttribute("enseignants", utilisateurRepository.findByRole("ENSEIGNANT"));
        model.addAttribute("matieres", matiereRepository.findAll());
        return "admin/manage-ajouterCours";
    }

    // Traitement pour ajouter un cours
    @PostMapping("/admin/add-cours")
    public String addCours(@RequestParam String date, @RequestParam String horaire,
                           @RequestParam String enseignant, @RequestParam String matiere,
                           @RequestParam String salle) {
        Cour cour = new Cour();
        CourId courId = new CourId();
        courId.setDate(date);
        courId.setHoraire(horaire);
        courId.setEnseignant(enseignant);
    
        cour.setId(courId);
        cour.setEnseignant(utilisateurRepository.findById(enseignant)
                .orElseThrow(() -> new IllegalArgumentException("Enseignant introuvable : " + enseignant)));
        cour.setNom(matiereRepository.findById(matiere)
                .orElseThrow(() -> new IllegalArgumentException("Matière introuvable : " + matiere)));
        cour.setSalle(salle);
    
        coursRepository.save(cour);
        return "redirect:/admin/manage-listCours";
    }
    
    // Page pour afficher la liste des cours
    @GetMapping("/admin/manage-listCours")
    public String showListCoursPage(Model model) {
        model.addAttribute("cours", coursRepository.findAll());
        return "admin/manage-listCours";
    }

    // Supprimer un cours
    @GetMapping("admin//delete-cours/{id}")
    public String deleteCours(@PathVariable String id) {
        String[] parts = id.split("-");
        if (parts.length != 3) throw new IllegalArgumentException("ID invalide : " + id);

        CourId courId = new CourId();
        courId.setDate(parts[0]);
        courId.setHoraire(parts[1]);
        courId.setEnseignant(parts[2]);

        coursRepository.deleteById(courId);
        return "redirect:/admin/manage-listCours";
    }


}
