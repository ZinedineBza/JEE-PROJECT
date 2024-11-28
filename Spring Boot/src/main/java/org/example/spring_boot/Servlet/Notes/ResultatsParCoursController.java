package org.example.spring_boot.Servlet.Notes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
public class ResultatsParCoursController {

    private final ResultatDAO resultatDAO;
    private final MatiereDAO matiereDAO;

    public ResultatsParCoursController(ResultatDAO resultatDAO, MatiereDAO matiereDAO) {
        this.resultatDAO = resultatDAO;
        this.matiereDAO = matiereDAO;
    }

    @GetMapping("/notes/resultatsParCours")
    public String consulterResultatsParCours(
            @RequestParam("nomCours") String nomCours,
            Model model) {
        try {
            // Vérification de l'existence du cours
            Matiere cours = matiereDAO.findByName(nomCours); // Assurez-vous que cette méthode existe dans MatiereDAO
            if (cours == null) {
                model.addAttribute("error", "Cours introuvable.");
                return "error"; // Vue d'erreur
            }

            // Récupération des résultats
            List<Resultat> resultats = resultatDAO.consulterResultatsParCours(cours);

            // Ajouter les données au modèle
            model.addAttribute("cours", cours);
            model.addAttribute("resultats", resultats);

            return "resultatsParCours"; // Correspond à /WEB-INF/jsp/resultatsParCours.jsp
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Erreur lors de la consultation des résultats par cours.");
            return "error"; // Vue d'erreur
        }
    }
}
