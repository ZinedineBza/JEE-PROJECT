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
    public String registerUser(String pseudo, String email, String motDePasse, String role, Model model) {
        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setPseudo(pseudo);
        utilisateur.setEmail(email);
        utilisateur.setMotDePasse(motDePasse);
        utilisateur.setRole(role);
    
        // Appel à la méthode du repository qui encode et sauvegarde
        utilisateurRepository.saveWithEncodedPassword(utilisateur, passwordEncoder);
    
        model.addAttribute("message", "Inscription réussie ! Vous pouvez maintenant vous connecter.");
        return "login";
    }
}
