package com.example.javaee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    // Page d'accueil pour l'administrateur
    @GetMapping("/admin")
    public String adminHomePage() {
        return "admin/admin"; // Correspond à templates/admin/admin.html
    }

    // Gestion des utilisateurs
    @GetMapping("/admin/manage-users")
    public String manageUsersPage() {
        return "admin/manage-users"; // Page pour gérer les utilisateurs
    }

    // Gestion des cours
    @GetMapping("/admin/manage-courses")
    public String manageCoursesPage() {
        return "admin/manage-courses"; // Page pour gérer les cours
    }

    // Tableaux de bord et statistiques
    @GetMapping("/admin/dashboard")
    public String dashboardPage() {
        return "admin/dashboard"; // Page qui affiche les statistiques
    }

    // Paramètres globaux
    @GetMapping("/admin/settings")
    public String settingsPage() {
        return "admin/settings"; // Page des paramètres
    }
}
