package org.example.spring_boot.Servlet.Resultat;
import jakarta.servlet.http.HttpServletResponse;
import org.example.spring_boot.Modele.DAO.ResultatRepository;
import org.example.spring_boot.Modele.Resultat;
import org.example.spring_boot.Modele.ResultatId;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DeleteResultatController {

    private final ResultatRepository resultatDAO;

    public DeleteResultatController(ResultatRepository resultatDAO) {
        this.resultatDAO = resultatDAO;
    }

    @PostMapping("/resultats/delete")
    public void deleteResultat(
            @RequestParam("etudiant") String etudiant,
            @RequestParam("cours") String cours,
            @RequestParam("date") String date,
            HttpServletResponse response) throws Exception {
        try {
            // Créer l'identifiant composite du résultat
            ResultatId id = new ResultatId();
            id.setEtudiant(etudiant);
            id.setMatiere(cours);
            id.setDate(date);

            System.out.println("Paramètres reçus - Étudiant: " + id.getEtudiant() + ", Cours: " + id.getMatiere() + ", Date: " + id.getDate());

            // Récupérer le résultat
            Resultat resultat = resultatDAO.get(id);
            if (resultat != null) {
                resultatDAO.delete(resultat);
            }

            // Rediriger vers la liste des résultats
            response.sendRedirect("/resultats/list");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors de la suppression du résultat.");
        }
    }
}
