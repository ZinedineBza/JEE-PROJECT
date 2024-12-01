package com.example.javaee.service;

import com.example.javaee.model.Utilisateur;
import com.example.javaee.repository.UtilisateurRepository;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UtilisateurDetailsService implements UserDetailsService {

    private final UtilisateurRepository utilisateurRepository;
    private final PasswordEncoder passwordEncoder;

    // Injection des dépendances via le constructeur
    public UtilisateurDetailsService(UtilisateurRepository utilisateurRepository, PasswordEncoder passwordEncoder) {
        this.utilisateurRepository = utilisateurRepository;
        this.passwordEncoder = passwordEncoder;
    }

    // Méthode pour sauvegarder un utilisateur avec un mot de passe encodé
    public Utilisateur saveWithEncodedPassword(Utilisateur utilisateur) {
        if (utilisateur.getMotDePasse() == null || utilisateur.getMotDePasse().isEmpty()) {
            throw new IllegalArgumentException("Le mot de passe ne peut pas être vide");
        }
        utilisateur.setMotDePasse(passwordEncoder.encode(utilisateur.getMotDePasse()));
        return utilisateurRepository.save(utilisateur);
    }

    @Override
    public UserDetails loadUserByUsername(String pseudo) throws UsernameNotFoundException {
        // Recherche de l'utilisateur par pseudo
        Utilisateur utilisateur = utilisateurRepository.findByPseudo(pseudo);
        if (utilisateur == null) {
            throw new UsernameNotFoundException("Pseudo introuvable : " + pseudo);
        }

        System.out.println("Utilisateur trouvé : " + utilisateur.getPseudo());
        System.out.println("Mot de passe encodé récupéré : " + utilisateur.getMotDePasse());
        System.out.println("Rôle de l'utilisateur : " + utilisateur.getRole());

        // Construction d'un objet UserDetails avec les données de l'utilisateur
        return User.builder()
                .username(utilisateur.getPseudo())
                .password(utilisateur.getMotDePasse())
                .roles(utilisateur.getRole()) // Spring Security attend que les rôles soient préfixés par `ROLE_`
                .build();
    }
}
