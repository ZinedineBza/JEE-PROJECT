package com.example.javaee.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LogoutController {
/*
    // Gestion de la déconnexion en POST
    @PostMapping("/logout")
    public String logout(HttpSession session) {
        if (session != null) {
            session.invalidate(); // Invalider la session (déconnexion)
        }
        return "redirect:/"; // Redirige vers la page de connexion (index.jsp)
    }

    // Gestion de la déconnexion en GET (même comportement que POST)
    @GetMapping("/logout")
    public String logoutGet(HttpSession session) {
        return logout(session); // Réutilise la méthode POST
    }
*/
    
}
