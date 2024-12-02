package com.example.javaee.controller;

import com.example.javaee.model.Utilisateur;
import com.example.javaee.repository.UtilisateurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class GlobalControllerAdvice {

    @Autowired
    private UtilisateurRepository utilisateurRepository;

    @ModelAttribute("utilisateur")
    public Utilisateur getUtilisateur() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getPrincipal())) {
            String pseudo = auth.getName();
            System.out.println("[GlobalControllerAdvice] Authenticated user pseudo: " + pseudo);
            Utilisateur utilisateur = utilisateurRepository.findByPseudo(pseudo);
            if (utilisateur != null) {
                System.out.println("[GlobalControllerAdvice] Utilisateur trouvé: " + utilisateur.getNom() + " " + utilisateur.getPrenom());
            } else {
                System.out.println("[GlobalControllerAdvice] Aucun utilisateur trouvé pour le pseudo: " + pseudo);
            }
            return utilisateur;
        }
        System.out.println("[GlobalControllerAdvice] Utilisateur non authentifié ou anonyme.");
        return null;
    }
}
