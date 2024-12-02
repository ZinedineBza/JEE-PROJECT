package com.example.javaee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EnseignantController {

    @GetMapping("/enseignant")
    public String enseignantHomePage() {
        return "enseignant/enseignant"; // Correspond à templates/enseignant/enseignant.html
    }

    // Gestion des étudiants
    @GetMapping("/manage-students")
    public String manageStudentsPage() {
        return "enseignant/manage-students";
    }

    // Gestion des cours
    @GetMapping("/add-course-material")
    public String addCourseMaterialPage() {
        return "enseignant/add-course-material";
    }

    // Gestion des cours
    @GetMapping("/view-courses")
    public String viewCoursesPage() {
        return "enseignant/view-courses";
    }

    // Notes des étudiants
    @GetMapping("/student-performance")
    public String studentPerformancePage() {
        return "enseignant/student-performance";
    }
}

