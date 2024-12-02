package com.example.javaee.controller;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.javaee.config.InputValidatorConfig;
import com.example.javaee.config.PasswordGenerator;
import com.example.javaee.model.*;
import com.example.javaee.repository.*;
import com.example.javaee.service.EmailService;

import jakarta.persistence.EntityManager;
import jakarta.servlet.http.HttpSession;

import com.example.javaee.repository.ClasseRepository;
import com.example.javaee.service.EmailService;

@Controller
public class AdminController {
    @Autowired
    private EntityManager entityManager;
    private final UtilisateurRepository utilisateurRepository;
    private final PasswordEncoder passwordEncoder;
    private final InscriptionRepository inscriptionRepository;
    private final MatiereRepository matiereRepository;
    private final ResultatRepository resultatRepository;
    private final CoursRepository coursRepository;
    private final ClasseRepository classeRepository;
    @Autowired
    private EmailService emailService;

    public AdminController(UtilisateurRepository utilisateurRepository, 
                           PasswordEncoder passwordEncoder, 
                           InscriptionRepository inscriptionRepository, 
                           MatiereRepository matiereRepository, ResultatRepository resultatRepository, 
                           CoursRepository coursRepository, ClasseRepository classeRepository) {
        this.utilisateurRepository = utilisateurRepository;
        this.passwordEncoder = passwordEncoder;
        this.inscriptionRepository = inscriptionRepository;
        this.matiereRepository = matiereRepository;
        this.resultatRepository = resultatRepository;
        this.coursRepository = coursRepository;
        this.classeRepository = classeRepository;
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
    public String addStudentPage(Model model) {
        List<Classe> classes = classeRepository.findAll();
        System.out.println("Classes : " + classes);
        model.addAttribute("classes", classes);
        return "admin/manage-ajouterEtudiant";
        }

    // Page pour ajouter un enseignant
    @GetMapping("/admin/manage-ajouterEnseignant")
    public String addTeacherPage() {
        return "admin/manage-ajouterEnseignant";
    }

    @PostMapping("/admin/add-etudiant")
    public String addStudent(@RequestParam String email,
                             @RequestParam String nom,
                             @RequestParam String prenom,
                             @RequestParam String dateNaissanceStr,
                             @RequestParam String classe,
                             Model model) {
        
        // Récupérer la liste des classes pour l'afficher dans le formulaire
        List<Classe> classes = classeRepository.findAll();
        model.addAttribute("classes", classes);
    
        // Validation des champs
        Map<String, String> errors = validateInput(nom, prenom, dateNaissanceStr, email);
        if (!errors.isEmpty()) {
            model.addAttribute("errors", errors);
            return "admin/manage-ajouterEtudiant";  // Retourner au formulaire si des erreurs existent
        }
    
        // Conversion de la date de naissance en LocalDate
        LocalDate dateNaissance = null;
        try {
            dateNaissance = LocalDate.parse(dateNaissanceStr);
        } catch (DateTimeParseException e) {
            errors.put("dateNaissance", "La date de naissance n'est pas valide.");
            model.addAttribute("errors", errors);
            return "admin/manage-ajouterEtudiant";  // Retourner en cas d'erreur de format
        }
    
        // Validation de la date de naissance : ne pas dans le futur
        if (dateNaissance.isAfter(LocalDate.now())) {
            errors.put("dateNaissance", "La date de naissance ne peut pas être dans le futur.");
            model.addAttribute("errors", errors);
            return "admin/manage-ajouterEtudiant";
        }
        
        // Génération du pseudo automatiquement
        String pseudo = generatePseudo(nom, prenom);  // Fonction pour générer le pseudo
        
        // Génération du mot de passe sécurisé
        String rawPassword = PasswordGenerator.generatePassword();
        String encodedPassword = passwordEncoder.encode(rawPassword);
        
        // Création de l'utilisateur
        Utilisateur etudiant = new Utilisateur();
        etudiant.setNom(nom);
        etudiant.setPrenom(prenom);
        etudiant.setEmail(email);
        etudiant.setDateNaissance(dateNaissanceStr);  // Vous pouvez aussi stocker le String original ici
        etudiant.setPseudo(pseudo);
        etudiant.setMotDePasse(encodedPassword);
        etudiant.setClasse(classeRepository.findById(classe).orElseThrow(() -> new IllegalArgumentException("Classe introuvable : " + classe)));
        etudiant.setRole("ETUDIANT");
    
        // Sauvegarde dans la base de données
        utilisateurRepository.save(etudiant);
        
        // Envoyer l'email de confirmation
        emailService.sendEmail(email, "Bienvenue sur notre plateforme", 
                               "Bonjour " + prenom + " " + nom + ",\n\nVotre inscription a été réussie. Voici vos identifiants de connexion :\n\n" +
                               "Pseudo: " + pseudo + "\nMot de passe: " + rawPassword + "\n\nNous vous souhaitons une excellente utilisation de la plateforme.");
    
        System.out.println("Mot de passe généré pour l'étudiant : " + rawPassword);
        
        // Rediriger vers la liste des étudiants
        return "redirect:/admin/manage-listeEtudiant";
    }
    

    @GetMapping("/admin/manage-updateInformations")
    public String showUpdateEtudiantPage(@RequestParam("email") String email, Model model) {
        // Récupérer l'utilisateur par email
        Utilisateur etudiant = utilisateurRepository.findById(email)
            .orElse(null);
        System.out.println("Etudiant à mettre à jour ppppppppp: " + etudiant);
        if (etudiant == null) {
            return "redirect:/admin/manage-listeEtudiant"; // Redirection si l'utilisateur n'existe pas
        }
        model.addAttribute("etudiant", etudiant); // Ajouter l'utilisateur au modèle
        return "admin/manage-updateInformations"; // Afficher le formulaire
    }

    // Mettre à jour les informations de l'étudiant
    @PostMapping("/admin/update-informations")
    public String updateUser(@ModelAttribute Utilisateur user, Model model, RedirectAttributes redirectAttributes) {
        // Étape 1 : Récupérer l'utilisateur existant
        Utilisateur existingUser = utilisateurRepository.findById(user.getEmail())
            .orElseThrow(() -> new IllegalArgumentException("Utilisateur introuvable"));
    
        // Étape 2 : Valider les champs
        Map<String, String> errors = validateInputWithoutMail(user.getNom(), user.getPrenom(), user.getDateNaissance());
        if (!errors.isEmpty()) {
            model.addAttribute("errors", errors);
            model.addAttribute("etudiant", existingUser);
            return "admin/manage-updateInformations";
        }
    
        // Étape 3 : Mettre à jour uniquement les champs modifiables
        existingUser.setNom(user.getNom());
        existingUser.setPrenom(user.getPrenom());
        existingUser.setDateNaissance(user.getDateNaissance());
    
        // Étape 4 : Vérifier si le mot de passe a été modifié
        if (!user.getMotDePasse().equals(existingUser.getMotDePasse())) {
            // Encoder uniquement si le mot de passe est modifié
            existingUser.setMotDePasse(passwordEncoder.encode(user.getMotDePasse()));
        }
    
        // Étape 5 : Sauvegarder l'utilisateur mis à jour
        utilisateurRepository.save(existingUser);
    
        // Étape 6 : Ajouter un message de confirmation
        redirectAttributes.addFlashAttribute("success", "Les informations ont été mises à jour avec succès.");
    
        return "redirect:/admin/manage-listeEtudiant";
    }
        
        

    private Map<String, String> validateInput(String nom, String prenom, String dateNaissanceStr, String email) {
        Map<String, String> errors = new HashMap<>();
    
        // Validation du nom
        if (nom == null || nom.trim().isEmpty()) {
            errors.put("nom", "Le nom est obligatoire.");
        } else if (!InputValidatorConfig.isValidName(nom)) {
            errors.put("nom", "Le nom doit contenir uniquement des lettres, des espaces ou des tirets.");
        }
    
        // Validation du prénom
        if (prenom == null || prenom.trim().isEmpty()) {
            errors.put("prenom", "Le prénom est obligatoire.");
        } else if (!InputValidatorConfig.isValidName(prenom)) {
            errors.put("prenom", "Le prénom doit contenir uniquement des lettres, des espaces ou des tirets.");
        }
    
        // Validation de l'email
        if (email == null || email.trim().isEmpty()) {
            errors.put("email", "L'email est obligatoire.");
        } else if (!InputValidatorConfig.isValidEmail(email)) {
            errors.put("email", "L'email n'est pas valide.");
        } else if (utilisateurRepository.existsByEmail(email)) {
            errors.put("email", "Cet email est déjà utilisé.");
        }
    
        // Validation de la date de naissance
        
        if (dateNaissanceStr == null || dateNaissanceStr.trim().isEmpty()) {
            errors.put("dateNaissance", "La date de naissance est obligatoire.");
        } else if (!InputValidatorConfig.isValidBirthDate(dateNaissanceStr)) {
            errors.put("dateNaissance", "La date de naissance doit être au format 'dd/MM/YYYY' et doit être une date valide, non dans le futur et après 1900.");
        }
    
        return errors;
    }
        
    private Map<String, String> validateInputWithoutMail(String nom, String prenom, String dateNaissanceStr) {
        Map<String, String> errors = new HashMap<>();
    
        // Validation du nom
        if (nom == null || nom.trim().isEmpty()) {
            errors.put("nom", "Le nom est obligatoire.");
        } else if (!nom.matches("^[A-Za-zÀ-ÖØ-öø-ÿ\\s'-]+$")) {
            errors.put("nom", "Le nom contient des caractères invalides.");
        }
    
        // Validation du prénom
        if (prenom == null || prenom.trim().isEmpty()) {
            errors.put("prenom", "Le prénom est obligatoire.");
        } else if (!prenom.matches("^[A-Za-zÀ-ÖØ-öø-ÿ\\s'-]+$")) {
            errors.put("prenom", "Le prénom contient des caractères invalides.");
        }
    
        // Validation de la date de naissance
        if (dateNaissanceStr == null || dateNaissanceStr.trim().isEmpty()) {
            errors.put("dateNaissance", "La date de naissance est obligatoire.");
        } else {
            try {
                LocalDate dateNaissance = LocalDate.parse(dateNaissanceStr);
                if (dateNaissance.isAfter(LocalDate.now())) {
                    errors.put("dateNaissance", "La date de naissance ne peut pas être dans le futur.");
                }
            } catch (DateTimeParseException e) {
                errors.put("dateNaissance", "La date de naissance n'est pas valide.");
            }
        }
    
        return errors;
    }
    
    
    private String generatePseudo(String prenom, String nom) {
        // Crée une base pour le pseudo : première lettre du prénom + 5 premières lettres du nom
        String basePseudo = prenom.substring(0, 1).toLowerCase() + nom.substring(0, Math.min(5, nom.length())).toLowerCase();
        String pseudo = basePseudo;
        int count = 1;
    
        // Vérifie si ce pseudo existe déjà dans la base de données
        while (utilisateurRepository.existsByPseudo(pseudo)) {
            // Si le pseudo existe, ajoute un compteur à la fin
            pseudo = basePseudo + count;
            count++;
        }
    
        // Retourne le pseudo généré
        return pseudo;
    }
    

    // Traitement pour ajouter un enseignant
    @PostMapping("/admin/add-enseignant")
    public String addTeacher(@RequestParam String email,
                            @RequestParam String nom,
                            @RequestParam String prenom,
                            @RequestParam String dateNaissanceStr,
                            @RequestParam String classe,
                            Model model) {
        
        // Validation des champs
        Map<String, String> errors = validateInput(nom, prenom, dateNaissanceStr, email);
        if (!errors.isEmpty()) {
            model.addAttribute("errors", errors);
            return "admin/manage-ajouterEtudiant";  // Retourner au formulaire si des erreurs existent
        }

        // Conversion de la date de naissance en LocalDate
        LocalDate dateNaissance = null;
        try {
            dateNaissance = LocalDate.parse(dateNaissanceStr);
        } catch (DateTimeParseException e) {
            errors.put("dateNaissance", "La date de naissance n'est pas valide.");
            model.addAttribute("errors", errors);
            return "admin/manage-ajouterEtudiant";  // Retourner en cas d'erreur de format
        }

        // Validation de la date de naissance : ne pas dans le futur
        if (dateNaissance.isAfter(LocalDate.now())) {
            errors.put("dateNaissance", "La date de naissance ne peut pas être dans le futur.");
            model.addAttribute("errors", errors);
            return "admin/manage-ajouterEnseignant";
        }
        
        // Génération du pseudo automatiquement
        String pseudo = generatePseudo(nom, prenom);  // Fonction pour générer le pseudo
        
        // Génération du mot de passe sécurisé
        String rawPassword = PasswordGenerator.generatePassword();
        String encodedPassword = passwordEncoder.encode(rawPassword);
        
        // Création de l'utilisateur
        Utilisateur enseignant = new Utilisateur();
        enseignant.setNom(nom);
        enseignant.setPrenom(prenom);
        enseignant.setEmail(email);
        enseignant.setDateNaissance(dateNaissanceStr);  // Vous pouvez aussi stocker le String original ici
        enseignant.setPseudo(pseudo);
        enseignant.setMotDePasse(encodedPassword);
        enseignant.setRole("ENSEIGNANT");
        
        // Sauvegarde dans la base de données
        utilisateurRepository.save(enseignant);
        
        System.out.println("Mot de passe généré pour l'étudiant : " + rawPassword);
        
        // Rediriger vers la liste des étudiants
        return "redirect:/admin/manage-listeEnseignant";
    }

    // Page pour afficher le formulaire de mise à jour d'un enseignant
    @GetMapping("/admin/delete-enseignantInfo")
    public String deleteEnseignant(@RequestParam String email, RedirectAttributes redirectAttributes) {
        utilisateurRepository.findById(email).ifPresentOrElse(
            utilisateur -> {
                utilisateurRepository.delete(utilisateur);
                redirectAttributes.addFlashAttribute("success", "L'utilisateur a été supprimé avec succès.");
            },
            () -> redirectAttributes.addFlashAttribute("error", "Utilisateur introuvable avec l'email : " + email)
        );
        return "redirect:/admin/manage-listeEnseignant";
    }
    
    // Page pour afficher le formulaire de mise à jour d'un enseignant
    @GetMapping("/admin/delete-etudiantInfo")
public String deleteEtudiant(@RequestParam String email, RedirectAttributes redirectAttributes) {
    utilisateurRepository.findById(email).ifPresentOrElse(
        utilisateur -> {
            utilisateurRepository.delete(utilisateur);
            redirectAttributes.addFlashAttribute("success", "L'utilisateur a été supprimé avec succès.");
        },
        () -> redirectAttributes.addFlashAttribute("error", "Utilisateur introuvable avec l'email : " + email)
    );
    return "redirect:/admin/manage-listeEtudiant";
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
    public String addInscription(@RequestParam String etudiantEmail, @RequestParam String matiereNom, Model model) {
        // Recherche de l'étudiant par email
        Utilisateur etudiant = utilisateurRepository.findByEmail(etudiantEmail);
        
        // Recherche de la matière par nom
        Matiere matiere = matiereRepository.findByNom(matiereNom).get(0);
    
        // Vérification si l'étudiant est déjà inscrit à la matière
        boolean alreadyEnrolled = inscriptionRepository.existsByEtudiantAndMatiere(etudiant, matiere);
        System.out.println("Inscription déjà existante : " + alreadyEnrolled);
        
        if (alreadyEnrolled) {
            // Si l'étudiant est déjà inscrit, rediriger avec un message d'erreur
            model.addAttribute("etudiants", utilisateurRepository.findByRole("ETUDIANT"));
            model.addAttribute("matieres", matiereRepository.findAll());    
            return "redirect:/admin/manage-inscription?error=alreadyEnrolled";
        }
    
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
    public String showInscriptions(Model model) {
        List<Inscription> inscriptions = inscriptionRepository.findAll();
        model.addAttribute("inscriptions", inscriptions);
        return "/admin/manage-listInscriptions";
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
            // Vérification que les paramètres nécessaires ne sont pas vides
            if (etudiantEmail == null || etudiantEmail.trim().isEmpty()) {
                throw new IllegalArgumentException("L'email de l'étudiant est requis.");
            }
            if (matiereNom == null || matiereNom.trim().isEmpty()) {
                throw new IllegalArgumentException("Le nom de la matière est requis.");
            }
    
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
    
            // Vérification si l'étudiant est déjà inscrit à cette matière
            boolean alreadyEnrolled = inscriptionRepository.existsByEtudiantAndMatiere(etudiant, matiere);
            if (!alreadyEnrolled) {
                throw new IllegalArgumentException("L'étudiant n'est pas inscrit à cette matière.");
            }
    
            // Vérification de la note (par exemple entre 0 et 20)
            if (note < 0 || note > 20) {
                throw new IllegalArgumentException("La note doit être comprise entre 0 et 20.");
            }
    
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
    
            // Redirection vers la liste des résultats
            return "redirect:/admin/manage-listResultat";
    
        } catch (IllegalArgumentException e) {
            // Gérer les erreurs et retourner à la page avec un message d'erreur
            model.addAttribute("error", e.getMessage());
            model.addAttribute("etudiants", utilisateurRepository.findByRole("ETUDIANT"));
            model.addAttribute("matieres", matiereRepository.findAll());
            return "admin/manage-ajouterResultat";
        }
    }
    
    // Page pour afficher la liste des résultats
    @GetMapping("/admin/manage-listResultat")
    public String manageListResultat(Model model) {
        List<Resultat> resultats = resultatRepository.findAll();
        model.addAttribute("resultats", resultats);
        return "admin/manage-listResultat";
    }

    @GetMapping("/admin/edit-resultat/{etudiant}/{matiere}/{date}")
    public String showEditResultatForm(
            @PathVariable("etudiant") String etudiant,
            @PathVariable("matiere") String matiere,
            @PathVariable("date") String date,
            Model model) {
    
        // Construire la clé composite
        ResultatId id = new ResultatId();
        id.setEtudiant(etudiant);
        id.setCours(matiere);
        id.setDate(date);
    
        // Récupérer le résultat
        Resultat resultat = resultatRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Résultat introuvable"));
    
        // Ajouter au modèle pour l'affichage
        model.addAttribute("resultat", resultat);
    
        return "admin/edit-resultat"; // Vue Thymeleaf pour éditer
    }
    
    @GetMapping("/admin/delete-inscription/{id}")
    public String deleteInscription(@PathVariable String id, RedirectAttributes redirectAttributes) {
        try {
        // Convertir l'ID
        InscriptionId inscriptionId = InscriptionId.fromString(id);

        // Trouver l'entité à supprimer
        Inscription inscription = entityManager.find(Inscription.class, inscriptionId);
        System.out.println("Inscription à supprimer : " + inscription);
        if (inscription != null) {
            entityManager.remove(inscription); // Suppression via EntityManager
            redirectAttributes.addFlashAttribute("message", "Inscription supprimée avec succès.");
        } else {
            redirectAttributes.addFlashAttribute("error", "Inscription introuvable.");
        }
    } catch (Exception e) {
        redirectAttributes.addFlashAttribute("error", "Erreur lors de la suppression : " + e.getMessage());
        e.printStackTrace();
    }
    return "redirect:/admin/manage-listInscriptions";
}
        
        


    /*********************** Ajouter, consulter, modifier et supprimer cours  **********************/
    
    // Page pour afficher le formulaire d'ajout de cours
    @GetMapping("/admin/manage-ajouterCours")
    public String showAddCoursPage(Model model) {
        // Récupérer l'utilisateur connecté à partir du contexte de sécurité
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        System.out.println("Utilisateur connecté : " + userDetails.getUsername());
        
        // Chercher l'utilisateur dans la base de données pour obtenir l'objet complet
        Utilisateur user = utilisateurRepository.findByPseudo(userDetails.getUsername());

        // Ajouter l'utilisateur au modèle
        model.addAttribute("user", user);
        System.out.println("Utilisateur connecté : " + user);

        // Ajouter les enseignants et matières au modèle
        model.addAttribute("enseignants", utilisateurRepository.findByRole("ENSEIGNANT".toUpperCase()));
        model.addAttribute("matieres", matiereRepository.findAll());
        System.out.println("Enseignants : " + utilisateurRepository.findByRole("ENSEIGNANT".toUpperCase()));
        System.out.println("Matières : " + matiereRepository.findAll());
        return "admin/manage-ajouterCours";
    }
    
    // Traitement du formulaire d'ajout de cours
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
    public String manageListCours(Model model) {
        // Récupérer la liste des cours depuis le repository
        List<Cour> coursList = coursRepository.findAll();  // ou une méthode plus spécifique si nécessaire
        model.addAttribute("coursList", coursList);
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

    /************************************ Notes*********************************/
    // Page pour lister les résultats de l'étudiant
    @GetMapping("/admin/manage-listeNotes")
    public String listStudentResults(@RequestParam("email") String email, Model model) {
        // Récupérer l'utilisateur (étudiant) basé sur l'email passé dans l'URL
        Utilisateur etudiant = utilisateurRepository.findByEmail(email);
        if (etudiant != null) {
            // Récupérer les résultats associés à cet étudiant
            List<Resultat> results = resultatRepository.findByEtudiant(etudiant);

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
        } else {
            model.addAttribute("error", "Étudiant non trouvé");
        }

        return "admin/manage-listeNotes"; // Retourner la page des résultats
    }
    
        
    /********************************* Liste cours **********************************/
    @GetMapping("/admin/getClasses")
    @ResponseBody
    public String getClasses() {
        // Récupérer toutes les classes
        List<Classe> classes = classeRepository.findAll();

        // Génération des options HTML pour les classes
        StringBuilder options = new StringBuilder();
        options.append("<option value=''>Sélectionnez une classe</option>");
        for (Classe classe : classes) {
            options.append("<option value='").append(classe.getClasse()).append("'>").append(classe.getClasse()).append("</option>");
        }
        return options.toString(); // Retourner les options HTML
    }

    @GetMapping("/admin/getEleves")
    @ResponseBody
    public String getEleves(@RequestParam String matiereId, @RequestParam String classeId) {
        // Récupérer les élèves inscrits dans cette matière et classe
        List<Utilisateur> eleves = utilisateurRepository.findElevesByClasseAndMatiereNative(classeId, matiereId);

        // Génération des lignes HTML pour les élèves
        StringBuilder rows = new StringBuilder();
        for (Utilisateur eleve : eleves) {
            rows.append("<tr><td>").append(eleve.getNom()).append("</td>")
                .append("<td>").append(eleve.getPrenom()).append("</td></tr>");
        }
        return rows.toString(); // Retourner les lignes HTML
    }

    @GetMapping("/admin/getMatieres")
    @ResponseBody
    public String getMatieres(Authentication authentication) {
        if (authentication == null || !authentication.isAuthenticated()) {
            return "Erreur : accès non autorisé.";
        }
    
        // Récupérer le pseudo de l'utilisateur connecté
        String pseudo = authentication.getName();
    
        // Récupérer l'utilisateur depuis votre base de données
        Utilisateur utilisateur = utilisateurRepository.findByPseudo(pseudo);
        if (utilisateur == null || !"admin".equalsIgnoreCase(utilisateur.getRole())) {
            return "Erreur : accès non autorisé.";
        }
    
        // Récupérer toutes les matières
        List<Matiere> matieres = matiereRepository.findAll();
    
        // Générer les options HTML
        StringBuilder options = new StringBuilder();
        options.append("<option value=''>Sélectionnez une matière</option>");
        for (Matiere matiere : matieres) {
            options.append("<option value='").append(matiere.getNom()).append("'>").append(matiere.getNom()).append("</option>");
        }
    
        return options.toString(); // Retourner les options en HTML
    }
        

}
