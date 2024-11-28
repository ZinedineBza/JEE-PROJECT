package org.example.spring_boot.Servlet.Etudiant;
import org.example.spring_boot.Modele.DAO.UtilisateurRepository;
import org.example.spring_boot.Modele.Utilisateur;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class GetElevesController {

    private final UtilisateurRepository utilisateurDAO;

    public GetElevesController(UtilisateurRepository utilisateurDAO) {
        this.utilisateurDAO = utilisateurDAO;
    }

    @GetMapping("/api/getEleves")
    public String getEleves(
            @RequestParam("matiereId") String matiereId,
            @RequestParam("classeId") String classeId) {

        // Récupérer les élèves inscrits dans cette matière et classe
        List<Utilisateur> eleves = utilisateurDAO.findElevesByClasseAndMatiere(classeId, matiereId);

        // Construire les lignes HTML pour le tableau
        StringBuilder rows = new StringBuilder();
        for (Utilisateur eleve : eleves) {
            rows.append("<tr>")
                    .append("<td>").append(eleve.getNom()).append("</td>")
                    .append("<td>").append(eleve.getPrenom()).append("</td>")
                    .append("</tr>");
        }

        return rows.toString();
    }
}
