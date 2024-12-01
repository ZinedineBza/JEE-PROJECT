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
        http.csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(auth -> auth
                                .requestMatchers("/", "/register", "/css/**").permitAll()
                                .requestMatchers("/admin/**").hasRole("ADMIN")
                                .requestMatchers("/enseignant/**").hasRole("ENSEIGNANT")
                                .requestMatchers("/etudiant/**").hasRole("ETUDIANT")
                                .anyRequest().authenticated()
                )
                .formLogin(form -> form
                                .loginPage("/") // Page de connexion
                                .loginProcessingUrl("/login") // Formulaire de traitement
                                .usernameParameter("pseudo") // Nom d'utilisateur
                                .passwordParameter("password") // Mot de passe
                                .defaultSuccessUrl("/redirect", true) // Méthode de redirection
                                .failureUrl("/?error=true") // En cas d'échec
                                .permitAll()
                )
                .logout(logout -> logout
                                .logoutUrl("/logout")
                                .logoutSuccessUrl("/")
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
