package org.example.spring_boot.Servlet.Notes;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import jakarta.servlet.http.HttpServletResponse;
import org.example.spring_boot.Modele.DAO.ResultatRepository;
import org.example.spring_boot.Modele.DAO.UtilisateurRepository;
import org.example.spring_boot.Modele.Resultat;
import org.example.spring_boot.Modele.Utilisateur;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@RestController
public class GeneratePDFController {

    private final UtilisateurRepository utilisateurDAO;
    private final ResultatRepository resultatDAO;

    public GeneratePDFController(UtilisateurRepository utilisateurDAO, ResultatRepository resultatDAO) {
        this.utilisateurDAO = utilisateurDAO;
        this.resultatDAO = resultatDAO;
    }

    @PostMapping("/notes/generatePDF")
    public void generatePDF(
            @RequestParam("etudiantEmail") String etudiantEmail,
            HttpServletResponse response) {
        try {
            // Récupérer l'étudiant
            Optional<Utilisateur> etudiantOpt = utilisateurDAO.findById(etudiantEmail);
            if (!etudiantOpt.isPresent()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Étudiant introuvable.");
                return;
            }
            Utilisateur etudiant = etudiantOpt.get();

            // Récupérer les résultats de l'étudiant
            List<Resultat> resultats = resultatDAO.findByEtudiant(etudiant);
            if (resultats.isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Aucun résultat trouvé pour cet étudiant.");
                return;
            }

            // Configuration de la réponse HTTP pour le PDF
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=\"Bulletin_" + etudiant.getNom() + ".pdf\"");

            // Génération du PDF
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
                    moyennesParMatiere.put(matiere,
                            resultatDAO.calculerMoyenneParEtudiantEtCours(resultat.getCours(), etudiant));
                }

                double sommeMoyennes = 0.0;
                int nombreDeCours = 0;

                // Ajouter les données au tableau
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
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors de la génération du PDF.");
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
}
