package com.example.javaee.controller;

import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;

import jakarta.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.util.List;

import com.example.javaee.model.*;
import com.example.javaee.repository.*;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

@RestController
public class PDFController {

    @Autowired
    private UtilisateurRepository utilisateurRepository;

    @Autowired
    private ResultatRepository resultatRepository;

@PostMapping("/generatePDF")
public void generatePDF(@RequestParam("etudiantEmail") String email, HttpServletResponse response) {
    try {
        // Récupérer l'étudiant par email
        Utilisateur etudiant = utilisateurRepository.findByEmail(email);
        if (etudiant == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Étudiant non trouvé");
            return;
        }

        // Récupérer les résultats de l'étudiant
        List<Resultat> results = resultatRepository.findByEtudiant(etudiant);

        // Configurer la réponse HTTP pour le PDF
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=Resultats_" + etudiant.getNom() + ".pdf");

        // Générer le PDF
        try (OutputStream out = response.getOutputStream()) {
            // Exemple avec iText
            Document document = new Document();
            PdfWriter.getInstance(document, out);
            document.open();

            // Ajouter les informations de l'étudiant
            document.add(new Paragraph("Résultats de : " + etudiant.getNom() + " " + etudiant.getPrenom()));
            document.add(new Paragraph("Email : " + etudiant.getEmail()));
            document.add(new Paragraph("\n"));

            // Ajouter les résultats
            for (Resultat resultat : results) {
                document.add(new Paragraph("Matière : " + resultat.getCours().getNom()));
                document.add(new Paragraph("Note : " + resultat.getNote()));
                document.add(new Paragraph("\n"));
            }

            document.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
}

    // Générer le contenu HTML à partir des données de l'étudiant et des résultats
    private String generateHTMLContent(Utilisateur etudiant, List<Resultat> resultats) {
        StringBuilder html = new StringBuilder();
        html.append("<!DOCTYPE html>");
        html.append("<html lang='fr'>");
        html.append("<head>");
        html.append("<meta charset='UTF-8'>");
        html.append("<style>");
        html.append("body { font-family: Arial, sans-serif; margin: 20px; }");
        html.append("table { border-collapse: collapse; width: 100%; }");
        html.append("th, td { border: 1px solid #ddd; padding: 8px; text-align: center; }");
        html.append("th { background-color: #007bff; color: white; }");
        html.append("tfoot td { background-color: #f4f4f4; font-weight: bold; }");
        html.append("</style>");
        html.append("</head>");
        html.append("<body>");
        html.append("<h1>Résultats de ").append(etudiant.getNom()).append(" ").append(etudiant.getPrenom()).append("</h1>");
        html.append("<table>");
        html.append("<thead>");
        html.append("<tr>");
        html.append("<th>Matière</th>");
        html.append("<th>Note</th>");
        html.append("<th>Commentaire</th>");
        html.append("</tr>");
        html.append("</thead>");
        html.append("<tbody>");
        for (Resultat resultat : resultats) {
            html.append("<tr>");
            html.append("<td>").append(resultat.getCours().getNom()).append("</td>");
            html.append("<td>").append(resultat.getNote()).append("</td>");
            html.append("<td>").append(resultat.getCommentaire() != null ? resultat.getCommentaire() : "N/A").append("</td>");
            html.append("</tr>");
        }
        html.append("</tbody>");
        html.append("<tfoot>");
        html.append("<tr>");
        html.append("<td colspan='3'>Total des notes : ").append(resultats.size()).append("</td>");
        html.append("</tr>");
        html.append("</tfoot>");
        html.append("</table>");
        html.append("</body>");
        html.append("</html>");
        return html.toString();
    }
}
