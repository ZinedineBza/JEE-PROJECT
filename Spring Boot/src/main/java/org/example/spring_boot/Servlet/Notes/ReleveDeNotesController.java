package org.example.spring_boot.Servlet.Notes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
public class ReleveDeNotesController {

    private final ResultatDAO resultatDAO;
    private final UtilisateurDAO utilisateurDAO;

    public ReleveDeNotesController(ResultatDAO resultatDAO, UtilisateurDAO utilisateurDAO) {
        this.resultatDAO = resultatDAO;
        this.utilisateurDAO = utilisateurDAO;
    }

    @GetMapping("/notes/releveDeNotes")
    public String afficherReleveDeNotes(
            @RequestParam("etudiantEmail") String etudiantEmail,
            Model model) {
        try {
            // Récupérer l'utilisateur
            Utilisateur etudiant = utilisateurDAO.findById(etudiantEmail);
            if (etudiant == null) {
                model.addAttribute("error", "Utilisateur introuvable.");
                return "error"; // Vue pour afficher une erreur
            }

            // Récupérer les résultats et la moyenne
            List<Resultat> releveDeNotes = resultatDAO.genererReleveDeNotes(etudiant);
            Double moyenne = resultatDAO.calculerMoyenneParEtudiant(etudiant);

            // Ajouter les données au modèle
            model.addAttribute("etudiant", etudiant);
            model.addAttribute("releveDeNotes", releveDeNotes);
            model.addAttribute("moyenne", moyenne);

            return "releveDeNotes"; // Correspond à /WEB-INF/jsp/releveDeNotes.jsp
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Erreur lors du traitement de la requête.");
            return "error"; // Vue pour afficher une erreur
        }
    }
}
