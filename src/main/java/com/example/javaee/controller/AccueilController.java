package com.example.javaee.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccueilController {

    @GetMapping("/redirect")
    public String redirectUser(Authentication authentication) {
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

