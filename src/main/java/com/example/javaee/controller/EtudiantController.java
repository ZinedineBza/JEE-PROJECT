package com.example.javaee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EtudiantController {

    // Page d'accueil pour les étudiants
    @GetMapping("/etudiant")
    public String etudiantHomePage() {
        return "etudiant/etudiant"; // Correspond à templates/etudiant/etudiant.html
    }

    // Voir les cours inscrits
    @GetMapping("/etudiant/view-courses")
    public String viewCoursesPage() {
        return "etudiant/view-courses"; // Page pour voir les cours
    }

    // Voir les résultats des examens
    @GetMapping("/etudiant/view-results")
    public String viewResultsPage() {
        return "etudiant/view-results"; // Page pour voir les résultats
    }

    // Inscription à de nouveaux cours
    @GetMapping("/etudiant/register-courses")
    public String registerCoursesPage() {
        return "etudiant/register-courses"; // Page pour s'inscrire à des cours
    }

    // Consulter le calendrier académique
    @GetMapping("/etudiant/view-calendar")
    public String viewCalendarPage() {
        return "etudiant/view-calendar"; // Page pour voir le calendrier académique
    }
}
