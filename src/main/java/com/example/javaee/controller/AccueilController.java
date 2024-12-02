package com.example.javaee.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.javaee.model.Utilisateur;

import jakarta.servlet.http.HttpSession;

@Controller
public class AccueilController {

    @GetMapping("/redirect")
    public String redirectUser(Authentication authentication, HttpSession session) {

        // Récupérer l'adresse email de l'utilisateur connectés
        String role = authentication.getAuthorities().iterator().next().getAuthority();
        System.out.println("Rôle récupéré : " + role);
    
        if (role.equals("ROLE_ADMIN")) {
            return "redirect:/admin";
        } else if (role.equals("ROLE_ENSEIGNANT")) {
            return "redirect:/enseignant";
        } else if (role.equals("ROLE_ETUDIANT")) {
            return "redirect:/etudiant";
        } else {
            return "redirect:/";
        }
    }
        
}

