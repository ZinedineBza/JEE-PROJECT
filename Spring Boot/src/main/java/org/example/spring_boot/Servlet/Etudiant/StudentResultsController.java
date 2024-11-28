package org.example.spring_boot.Servlet.Etudiant;
import jakarta.servlet.http.HttpSession;
import org.example.spring_boot.Modele.DAO.ResultatRepository;
import org.example.spring_boot.Modele.DAO.UtilisateurRepository;
import org.example.spring_boot.Modele.Resultat;
import org.example.spring_boot.Modele.Utilisateur;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.*;

@Controller
public class StudentResultsController {

    private final UtilisateurRepository utilisateurDAO;
    private final ResultatRepository resultatDAO;

    public StudentResultsController(UtilisateurRepository utilisateurDAO, ResultatRepository resultatDAO) {
        this.utilisateurDAO = utilisateurDAO;
        this.resultatDAO = resultatDAO;
    }

    @GetMapping("/etudiant/studentResults")
    public String getStudentResults(
            @RequestParam(value = "email", required = false) String email,
            HttpSession session,
            Model model) {

        Utilisateur user = (Utilisateur) session.getAttribute("user");
        String etudiantEmail;

        if ("admin".equals(user.getRole())) {
            etudiantEmail = email; // Admin peut consulter les résultats de n'importe quel étudiant
        } else {
            etudiantEmail = user.getEmail(); // Étudiant voit ses propres résultats
        }

        // Récupération des données de l'étudiant
        Utilisateur etudiant = utilisateurDAO.findById(etudiantEmail);
        if (etudiant == null) {
            model.addAttribute("errorMessage", "Étudiant introuvable.");
            return "error"; // Vue pour afficher une erreur
        }

        // Récupération des résultats de l'étudiant
        List<Resultat> resultats = resultatDAO.findByEtudiant(etudiant);
        boolean notesVides = resultats.isEmpty();

        // Regrouper les résultats par matière et calculer les moyennes
        Map<String, ResultatSummary> resultatsParMatiere = new HashMap<>();
        for (Resultat resultat : resultats) {
            String matiere = resultat.getCours().getNom();
            ResultatSummary summary = resultatsParMatiere.computeIfAbsent(matiere, k -> new ResultatSummary());
            summary.addResultat(resultat);
        }

        // Calcul de la moyenne générale
        double sommeMoyennes = 0.0;
        int nombreDeCours = 0;

        for (ResultatSummary summary : resultatsParMatiere.values()) {
            if (summary.getMoyenne() > 0) {
                sommeMoyennes += summary.getMoyenne();
                nombreDeCours++;
            }
        }

        double moyenneGenerale = (nombreDeCours > 0) ? (sommeMoyennes / nombreDeCours) : 0.0;

        // Ajouter les données au modèle pour la vue
        model.addAttribute("notesVides", notesVides);
        model.addAttribute("etudiant", etudiant);
        model.addAttribute("resultatsParMatiere", resultatsParMatiere.values());
        model.addAttribute("moyenneGenerale", String.format("%.2f", moyenneGenerale));

        return "Etudiant/studentResults"; // Correspond à /WEB-INF/jsp/Etudiant/studentResults.jsp
    }

    // Classe interne pour regrouper les résultats par matière
    public static class ResultatSummary {
        private String matiere;
        private List<Float> notes = new ArrayList<>();
        private double moyenne;

        public void addResultat(Resultat resultat) {
            this.matiere = resultat.getCours().getNom();
            this.notes.add(resultat.getNote());
            this.moyenne = notes.stream().mapToDouble(Float::doubleValue).average().orElse(0.0);
        }

        // Getters pour la JSP
        public String getMatiere() {
            return matiere;
        }

        public List<Float> getNotes() {
            return notes;
        }

        public double getMoyenne() {
            return moyenne;
        }
    }
}
