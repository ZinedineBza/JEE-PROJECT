package com.example.javaee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EnseignantController {

    // Page d'accueil pour les enseignants
    @GetMapping("/enseignant")
    public String enseignantHomePage() {
        return "enseignant/enseignant"; // Correspond à templates/enseignant/enseignant.html
    }

    // Gérer les étudiants dans leurs cours
    @GetMapping("/enseignant/manage-students")
    public String manageStudentsPage() {
        return "enseignant/manage-students"; // Page pour gérer les étudiants
    }

    // Ajouter des supports de cours
    @GetMapping("/enseignant/add-course-material")
    public String addCourseMaterialPage() {
        return "enseignant/add-course-material"; // Page pour ajouter des supports
    }

    // Consulter les cours attribués
    @GetMapping("/enseignant/view-courses")
    public String viewCoursesPage() {
        return "enseignant/view-courses"; // Page pour voir les cours
    }

    // Consulter les performances des étudiants
    @GetMapping("/enseignant/student-performance")
    public String studentPerformancePage() {
        return "enseignant/student-performance"; // Page pour voir les performances des étudiants
    }
}
