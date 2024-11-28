package org.example.spring_boot.Servlet.Inscription;
import org.example.spring_boot.Modele.DAO.InscriptionRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DeleteInscriptionController {

    private final InscriptionRepository inscriptionDAO;

    public DeleteInscriptionController(InscriptionRepository inscriptionDAO) {
        this.inscriptionDAO = inscriptionDAO;
    }

    @GetMapping("/etudiant/deleteInscription")
    public String deleteInscription(
            @RequestParam("etudiantEmail") String etudiantEmail,
            @RequestParam("matiere") String matiereNom) {

        // Validation des paramètres
        if (etudiantEmail == null || matiereNom == null) {
            throw new IllegalArgumentException("Paramètres invalides pour la suppression");
        }

        // Supprimer l'inscription
        boolean deleted = inscriptionDAO.deleteInscription(etudiantEmail, matiereNom);
        if (!deleted) {
            throw new IllegalStateException("Échec de la suppression de l'inscription");
        }

        // Redirection vers la liste des inscriptions
        return "redirect:/etudiant/listInscriptions"; // Assurez-vous que cette route est configurée
    }
}
