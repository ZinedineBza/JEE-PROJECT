package jeeprojet.application.Servlet.Etudiant;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.ResultatDAO;
import jeeprojet.application.Modele.DAO.UtilisateurDAO;
import jeeprojet.application.Modele.Resultat;
import jeeprojet.application.Modele.Utilisateur;

@WebServlet("/studentResults")
public class StudentResultsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer l'email de l'étudiant depuis les paramètres de la requête
        String etudiantEmail = request.getParameter("etudiantEmail");

        // Initialisation des DAO
        UtilisateurDAO utilisateurDAO = new UtilisateurDAO();
        ResultatDAO resultatDAO = new ResultatDAO();

        // Récupération des données de l'étudiant
        Utilisateur etudiant = utilisateurDAO.findById(etudiantEmail);
        if (etudiant == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Étudiant introuvable.");
            return;
        }

        // Récupération des résultats de l'étudiant
        List<Resultat> resultats = resultatDAO.findByUser(etudiant);
        if (resultats.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Aucun résultat trouvé pour cet étudiant.");
            return;
        }

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

        // Ajouter les données au modèle (requête)
        request.setAttribute("etudiant", etudiant);
        request.setAttribute("resultatsParMatiere", resultatsParMatiere.values());
        request.setAttribute("moyenneGenerale", String.format("%.2f", moyenneGenerale));

        // Rediriger vers la JSP
        request.getRequestDispatcher("/Etudiant/studentResults.jsp").forward(request, response);
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

        // Getters pour JSP
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
