package jeeprojet.application.Servlet.Notes;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.ResultatDAO;
import jeeprojet.application.Modele.DAO.UtilisateurDAO;
import jeeprojet.application.Modele.Resultat;
import jeeprojet.application.Modele.Utilisateur;

@WebServlet("/generatePDF")
public class GeneratePDFServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        List<Resultat> resultats = resultatDAO.findByUser(etudiant);
        if (resultats.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Aucun résultat trouvé pour cet étudiant.");
            return;
        }

        // Configuration de la réponse HTTP pour le PDF
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"Bulletin_" + etudiant.getNom() + ".pdf\"");

        try (PdfWriter writer = new PdfWriter(response.getOutputStream());
             PdfDocument pdfDoc = new PdfDocument(writer);
             Document document = new Document(pdfDoc)) {

            // Titre du document
            document.add(new Paragraph("Bulletin de notes")
                    .setBold()
                    .setFontSize(18));

            // Informations sur l'étudiant
            document.add(new Paragraph("Nom : " + etudiant.getNom() + " " + etudiant.getPrenom()));
            document.add(new Paragraph("Email : " + etudiant.getEmail()));
            document.add(new Paragraph("\n"));

            // Création du tableau des résultats
            Table table = new Table(3);
            table.addHeaderCell("Matière");
            table.addHeaderCell("Moyenne du cours");
            table.addHeaderCell("Notes");

            // Regrouper les résultats par matière
            Map<String, List<Float>> notesParMatiere = new HashMap<>();
            Map<String, Double> moyennesParMatiere = new HashMap<>();

            for (Resultat resultat : resultats) {
                String matiere = resultat.getCours().getNom();
                notesParMatiere.computeIfAbsent(matiere, k -> new ArrayList<>()).add(resultat.getNote());
                moyennesParMatiere.put(matiere, resultatDAO.calculerMoyenneParEtudiantEtCours(etudiant, resultat.getCours()));
            }

            double sommeMoyennes = 0.0;
            int nombreDeCours = 0;

            // Ajout des données au tableau
            for (Map.Entry<String, List<Float>> entry : notesParMatiere.entrySet()) {
                String matiere = entry.getKey();
                List<Float> notes = entry.getValue();
                Double moyenne = moyennesParMatiere.get(matiere);

                table.addCell(matiere);
                table.addCell(String.format("%.2f", moyenne != null ? moyenne : 0.0));
                table.addCell(notes.stream().map(String::valueOf).collect(Collectors.joining(", ")));

                // Cumul pour la moyenne générale
                if (moyenne != null) {
                    sommeMoyennes += moyenne;
                    nombreDeCours++;
                }
            }

            // Calcul de la moyenne générale
            double moyenneGenerale = (nombreDeCours > 0) ? (sommeMoyennes / nombreDeCours) : 0.0;

            // Ajouter la ligne pour la moyenne générale
            table.addCell("Moyenne Générale");
            table.addCell(String.format("%.2f", moyenneGenerale));
            table.addCell("");

            document.add(table);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors de la génération du PDF.");
        }
    }
}
