package org.example.spring_boot.Servlet.Notes;
import org.example.spring_boot.Modele.DAO.ResultatRepository;
import org.example.spring_boot.Modele.Matiere;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MoyenneParCoursController {

    private final ResultatRepository resultatDAO;

    public MoyenneParCoursController(ResultatRepository resultatDAO) {
        this.resultatDAO = resultatDAO;
    }

    @GetMapping("/notes/moyenneParCours")
    public String calculerMoyenneParCours(
            @RequestParam("nomCours") String nomCours,
            Model model) {

        try {
            // Récupérer le cours par son nom
            Matiere cours = resultatDAO.findCoursByName(nomCours); // Implémentez cette méthode dans votre DAO
            if (cours == null) {
                model.addAttribute("error", "Cours introuvable.");
                return "error"; // Vue d'erreur
            }

            // Calculer la moyenne
            Double moyenne = resultatDAO.calculerMoyenneParCours(cours);

            // Ajouter les données au modèle
            model.addAttribute("cours", cours);
            model.addAttribute("moyenne", moyenne);

            return "moyenneParCours"; // Correspond à /WEB-INF/jsp/moyenneParCours.jsp
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Erreur lors du calcul de la moyenne.");
            return "error"; // Vue d'erreur
        }
    }
}
