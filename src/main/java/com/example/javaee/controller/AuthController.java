package com.example.javaee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.example.javaee.model.Utilisateur;
import com.example.javaee.repository.UtilisateurRepository;

@Controller
public class AuthController {

    private final UtilisateurRepository utilisateurRepository;
    private final PasswordEncoder passwordEncoder;

    public AuthController(UtilisateurRepository utilisateurRepository, PasswordEncoder passwordEncoder) {
        this.utilisateurRepository = utilisateurRepository;
        this.passwordEncoder = passwordEncoder;
    }

    // Redirection de la racine vers la page de connexion (index.html)
    @GetMapping("/")
    public String showLoginPage(Model model, String error) {
        if (error != null) {
            model.addAttribute("error", "Email ou mot de passe incorrect.");
        }
        return "index"; // Correspond à templates/index.html
    }

    @GetMapping("/register")
    public String showRegisterPage() {
        return "register"; // Correspond à register.html
    }

    @PostMapping("/register")
    public String registerUser(String email, String password, String role, Model model) {
        // Vérifiez que l'utilisateur n'existe pas déjà
        if (utilisateurRepository.findByEmail(email) != null) {
            model.addAttribute("error", "Cet email est déjà utilisé.");
            return "register"; // Retourne la page d'inscription avec une erreur
        }

        // Créez un nouvel utilisateur
        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setEmail(email);
        utilisateur.setMotDePasse(passwordEncoder.encode(password)); // Encodez le mot de passe
        utilisateur.setRole(role);

        // Sauvegardez l'utilisateur dans la base de données
        utilisateurRepository.save(utilisateur);

        // Ajoutez un message de succès
        model.addAttribute("message", "Inscription réussie. Veuillez vous connecter.");
        return "index"; // Redirige vers la page de connexion après l'inscription
    }
}
