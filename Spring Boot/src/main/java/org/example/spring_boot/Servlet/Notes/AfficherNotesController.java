package org.example.spring_boot.Servlet.Notes;
import org.example.spring_boot.Modele.DAO.ResultatRepository;
import org.example.spring_boot.Modele.Resultat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class AfficherNotesController {

    private final ResultatRepository resultatDAO;

    public AfficherNotesController(ResultatRepository resultatDAO) {
        this.resultatDAO = resultatDAO;
    }

    @GetMapping("/notes/afficher")
    public String afficherNotes(Model model) {
        try {
            // Obtenir toutes les notes depuis le DAO
            List<Resultat> resultats = resultatDAO.obtenirToutesLesNotes();

            // Ajouter les résultats au modèle pour la vue
            model.addAttribute("resultats", resultats);

            return "afficherNotes"; // Correspond à /WEB-INF/jsp/afficherNotes.jsp
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "Erreur lors de l'affichage des notes.");
            return "error"; // Vue pour afficher une erreur
        }
    }
}
