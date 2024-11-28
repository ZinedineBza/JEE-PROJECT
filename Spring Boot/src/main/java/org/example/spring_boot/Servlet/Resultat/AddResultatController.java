package org.example.spring_boot.Servlet.Resultat;
import jakarta.servlet.http.HttpServletResponse;
import org.example.spring_boot.Modele.DAO.MatiereRepository;
import org.example.spring_boot.Modele.DAO.ResultatRepository;
import org.example.spring_boot.Modele.DAO.UtilisateurRepository;
import org.example.spring_boot.Modele.Matiere;
import org.example.spring_boot.Modele.Resultat;
import org.example.spring_boot.Modele.ResultatId;
import org.example.spring_boot.Modele.Utilisateur;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class AddResultatController {

    private final UtilisateurRepository utilisateurDAO;
    private final MatiereRepository matiereDAO;
    private final ResultatRepository resultatDAO;

    public AddResultatController(UtilisateurRepository utilisateurDAO, MatiereRepository matiereDAO, ResultatRepository resultatDAO) {
        this.utilisateurDAO = utilisateurDAO;
        this.matiereDAO = matiereDAO;
        this.resultatDAO = resultatDAO;
    }

    @PostMapping("/resultats/add")
    public void addResultat(
            @RequestParam("etudiant") String etudiantId,
            @RequestParam("cours") String coursId,
            @RequestParam("note") String noteStr,
            @RequestParam(value = "commentaire", required = false) String commentaire,
            @RequestParam("date") String date,
            HttpServletResponse response) throws Exception {
        try {
            // Validation des paramètres
            if (etudiantId == null || coursId == null || noteStr == null) {
                response.getWriter().write("Erreur : Les paramètres obligatoires sont manquants.");
                return;
            }

            // Convertir la note en Float
            Float note = Float.parseFloat(noteStr);

            // Récupérer l'étudiant et le cours
            Optional<Utilisateur> etudiant = utilisateurDAO.findById(etudiantId);
            Optional<Matiere> cours = matiereDAO.findById(coursId);

            // Vérifier si l'étudiant et le cours existent
            if (etudiant == null || cours == null) {
                response.getWriter().write("Erreur : L'étudiant ou le cours n'existe pas.");
                return;
            }

            // Créer un identifiant composite pour le résultat
            ResultatId id = new ResultatId();
            id.setEtudiant(etudiant.get().getEmail());
            id.setMatiere(cours.get().getNom());
            id.setDate(date);

            // Créer l'objet Resultat
            Resultat resultat = new Resultat();
            resultat.setId(id);
            resultat.setEtudiant(etudiant);
            resultat.setCours(cours);
            resultat.setNote(note);
            resultat.setCommentaire(commentaire);

            // Sauvegarder l'objet Resultat dans la base de données
            resultatDAO.save(resultat);

            // Rediriger vers la liste des résultats
            response.sendRedirect("/resultats/list");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors de l'ajout du résultat.");
        }
    }
}
