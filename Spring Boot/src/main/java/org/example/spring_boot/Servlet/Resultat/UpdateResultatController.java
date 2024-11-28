package org.example.spring_boot.Servlet.Resultat;
import jakarta.servlet.http.HttpServletResponse;
import org.example.spring_boot.Modele.DAO.ResultatRepository;
import org.example.spring_boot.Modele.Resultat;
import org.example.spring_boot.Modele.ResultatId;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UpdateResultatController {

    private final ResultatRepository resultatDAO;

    public UpdateResultatController(ResultatRepository resultatDAO) {
        this.resultatDAO = resultatDAO;
    }

    @PostMapping("/resultats/update")
    public void updateResultat(
            @RequestParam("etudiant") String etudiantId,
            @RequestParam("cours") String coursId,
            @RequestParam("date") String date,
            @RequestParam("note") float note,
            @RequestParam("commentaire") String commentaire,
            HttpServletResponse response) throws Exception {
        try {
            System.out.println("Paramètres reçus - Étudiant: " + etudiantId + ", Cours: " + coursId + ", Date: " + date + ", Note: " + note + ", Commentaire: " + commentaire);

            // Création de l'ID composite
            ResultatId id = new ResultatId();
            id.setMatiere(coursId);
            id.setDate(date);
            id.setEtudiant(etudiantId);

            // Récupérer l'objet Resultat à partir de l'ID composite
            Resultat resultat = resultatDAO.get(id);
            if (resultat != null) {
                System.out.println("Résultat trouvé: " + resultat);

                // Mise à jour des valeurs
                resultat.setNote(note);
                resultat.setCommentaire(commentaire);

                // Sauvegarder les modifications
                resultatDAO.update(resultat);
                System.out.println("Résultat mis à jour avec la nouvelle note: " + note + " et commentaire: " + commentaire);
            } else {
                System.out.println("Aucun résultat trouvé pour l'ID donné.");
            }

            // Redirection après mise à jour
            response.sendRedirect("/resultats/list");
            System.out.println("Redirection vers la liste des résultats.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors de la mise à jour du résultat.");
        }
    }
}
