package com.example.javaee.service;

import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;


import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

public class PdfGenerator {

    public static void generatePDF(String htmlContent, String outputFilePath) {
        try (OutputStream outputStream = new FileOutputStream(new File(outputFilePath))) {
            PdfRendererBuilder builder = new PdfRendererBuilder();
            builder.useFastMode();
            builder.withHtmlContent(htmlContent, null);
            builder.toStream(outputStream);
            builder.run();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        // Exemple de contenu HTML
        String htmlContent = """
            <!DOCTYPE html>
            <html lang="fr">
            <head>
                <meta charset="UTF-8">
                <title>Résultats de l'étudiant</title>
                <style>
                    body { font-family: Arial, sans-serif; margin: 20px; }
                    table { border-collapse: collapse; width: 100%; }
                    th, td { border: 1px solid #ddd; padding: 8px; text-align: center; }
                    th { background-color: #007bff; color: white; }
                    tfoot td { background-color: #f4f4f4; font-weight: bold; }
                </style>
            </head>
            <body>
                <h1>Résultats de Jean Dupont</h1>
                <table>
                    <thead>
                        <tr>
                            <th>Matière</th>
                            <th>Moyenne</th>
                            <th>Notes</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Mathématiques</td>
                            <td>15.5</td>
                            <td>14, 16</td>
                        </tr>
                        <tr>
                            <td>Physique</td>
                            <td>17.0</td>
                            <td>16, 18</td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td>Moyenne Générale</td>
                            <td colspan="2">16.25</td>
                        </tr>
                    </tfoot>
                </table>
            </body>
            </html>
        """;

        // Chemin de sortie
        String outputFilePath = "resultats_etudiant.pdf";

        // Générer le PDF
        generatePDF(htmlContent, outputFilePath);

        System.out.println("PDF généré avec succès : " + outputFilePath);
    }
}
