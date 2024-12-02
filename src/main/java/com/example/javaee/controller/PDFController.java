package com.example.javaee.controller;

import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayOutputStream;
import java.util.List;

import com.example.javaee.model.*;
import com.example.javaee.repository.*;

@RestController
public class PDFController {

    @Autowired
    private UtilisateurRepository utilisateurRepository;

    @Autowired
    private ResultatRepository resultatRepository;

@GetMapping("/generate-pdf")
@ResponseBody
public ResponseEntity<byte[]> generatePDF(@RequestParam("email") String email) {
    // Étape 1 : Récupérer l'utilisateur par email
    Utilisateur etudiant = utilisateurRepository.findByEmail(email);
    if (etudiant == null) {
        return ResponseEntity.badRequest().body("Utilisateur non trouvé.".getBytes());
    }

    // Étape 2 : Récupérer les résultats associés à l'étudiant
    List<Resultat> resultats = resultatRepository.findByEtudiant_Email(email);
    if (resultats.isEmpty()) {
        return ResponseEntity.badRequest().body("Aucun résultat trouvé pour cet étudiant.".getBytes());
    }

    // Étape 3 : Générer le contenu HTML
    String htmlContent = generateHTMLContent(etudiant, resultats);

    // Étape 4 : Convertir le contenu HTML en PDF
    try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
        PdfRendererBuilder builder = new PdfRendererBuilder();
        builder.useFastMode(); // Mode rapide
        builder.withHtmlContent(htmlContent, null); // Contenu HTML
        builder.toStream(outputStream); // Flux de sortie
        builder.run();

        // Retourner le PDF en tant que fichier téléchargeable
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=resultats_" + email + ".pdf")
                .body(outputStream.toByteArray());
    } catch (Exception e) {
        e.printStackTrace();
        // Gérer les erreurs lors de la génération du PDF
        return ResponseEntity.internalServerError().body("Erreur lors de la génération du PDF.".getBytes());
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
