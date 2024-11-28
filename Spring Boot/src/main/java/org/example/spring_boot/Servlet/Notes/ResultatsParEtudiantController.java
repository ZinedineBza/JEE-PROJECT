package org.example.spring_boot.Servlet.Notes;
import org.example.spring_boot.Modele.DAO.ResultatRepository;
import org.example.spring_boot.Modele.DAO.UtilisateurRepository;
import org.example.spring_boot.Modele.Resultat;
import org.example.spring_boot.Modele.Utilisateur;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
public class ResultatsParEtudiantController {

    private final UtilisateurRepository utilisateurDAO;
    private final ResultatRepository resultatDAO;

    public ResultatsParEtudiantController(UtilisateurRepository utilisateurDAO, ResultatRepository resultatDAO) {
        this.utilisateurDAO = utilisateurDAO;
        this.resultatDAO = resultatDAO;
    }

    @GetMapping("/notes/resultatsParEtudiant")
    public String consulterResultatsParEtudiant(
            @RequestParam("etudiantEmail") String etudiantEmail,
            Model model) {
        try {
            // Vérification de l'existence de l'étudiant
            Optional<Utilisateur> etudiant = utilisateurDAO.findById(etudiantEmail);
            if (etudiant == null) {
                model.addAttribute("error", "Étudiant introuvable.");
                return "error"; // Vue d'erreur
            }

            // Récupération des résultats
            List<Resultat> resultats = resultatDAO.consulterResultatsParEtudiant(etudiant);

            // Ajouter les données au modèle
            model.addAttribute("etudiant", etudiant);
            model.addAttribute("resultats", resultats);

            return "resultatsParEtudiant"; // Correspond à /WEB-INF/jsp/resultatsParEtudiant.jsp
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Erreur lors de la consultation des résultats par étudiant.");
            return "error"; // Vue d'erreur
        }
    }
}
