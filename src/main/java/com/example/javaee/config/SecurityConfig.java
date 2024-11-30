package com.example.javaee.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.csrf().disable()
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/", "/register", "/css/**").permitAll() // Autorise l'accès à /
                .requestMatchers("/admin/**").hasRole("ADMIN") // Accès admin
                .requestMatchers("/enseignant/**").hasRole("ENSEIGNANT") // Accès enseignant
                .requestMatchers("/etudiant/**").hasRole("ETUDIANT") // Accès étudiant
                .anyRequest().authenticated() // Toutes les autres pages nécessitent une authentification
            )
            .formLogin(form -> form
                .loginPage("/") // Définit la page de connexion comme étant `/`
                .defaultSuccessUrl("/welcome", true) // Redirige après une connexion réussie
                .permitAll()
            )
            .logout(logout -> logout
                .logoutUrl("/logout")
                .logoutSuccessUrl("/") // Redirige vers `/` après déconnexion
                .permitAll()
            );
        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(); // Encodeur de mot de passe
    }
}
