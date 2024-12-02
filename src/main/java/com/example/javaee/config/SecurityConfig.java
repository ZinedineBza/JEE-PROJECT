package com.example.javaee.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.csrf(csrf -> csrf.disable()) // Désactivation de CSRF pour simplifier les tests (activer en production)
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/", "/register", "/css/**").permitAll() // Autoriser l'accès public
                        .requestMatchers("/admin/**").hasRole("ADMIN") // Accès réservé aux admins
                        .requestMatchers("/enseignant/**").hasRole("ENSEIGNANT") // Accès réservé aux enseignants
                        .requestMatchers("/etudiant/**").hasRole("ETUDIANT") // Accès réservé aux étudiants
                        .anyRequest().authenticated() // Authentification requise pour le reste
                )
                .formLogin(form -> form
                        .loginPage("/") // Page de connexion
                        .loginProcessingUrl("/login") // URL de traitement du formulaire
                        .usernameParameter("pseudo") // Nom d'utilisateur
                        .passwordParameter("password") // Mot de passe
                        .defaultSuccessUrl("/redirect", true) // Redirection après connexion réussie
                        .failureUrl("/?error=true") // Redirection en cas d'échec
                        .permitAll()
                )
                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/") // Redirection après déconnexion
                        .permitAll()
                );

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(); // Encodeur de mot de passe
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
        return config.getAuthenticationManager();
    }
}
