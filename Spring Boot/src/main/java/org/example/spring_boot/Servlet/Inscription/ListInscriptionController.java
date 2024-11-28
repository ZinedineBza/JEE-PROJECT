package org.example.spring_boot.Servlet.Inscription;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class ListInscriptionController {

    private final InscriptionDAO inscriptionDAO;
    private final MatiereDAO matiereDAO;

    public ListInscriptionController(InscriptionDAO inscriptionDAO, MatiereDAO matiereDAO) {
        this.inscriptionDAO = inscriptionDAO;
        this.matiereDAO = matiereDAO;
    }

    @GetMapping("/inscriptions")
    public String listInscriptions(HttpSession session, Model model) {
        // Récupérer l'utilisateur connecté
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("user");

        if (utilisateur == null) {
            return "redirect:/index"; // Rediriger vers la page de connexion
        }

        List<Inscription> inscriptions;

        // Récupérer les inscriptions selon le rôle de l'utilisateur
        if ("admin".equals(utilisateur.getRole())) {
            inscriptions = inscriptionDAO.findAll();
            model.addAttribute("inscriptions", inscriptions);
            return "Admin/listInscription"; // Correspond à /WEB-INF/jsp/Admin/listInscription.jsp

        } else if ("etudiant".equals(utilisateur.getRole())) {
            inscriptions = inscriptionDAO.findCoursUtilisateur(utilisateur.getEmail());
            List<Matiere> matieres = matiereDAO.findAll();
            model.addAttribute("matieres", matieres);
            model.addAttribute("inscriptions", inscriptions);
            return "Etudiant/listInscription"; // Correspond à /WEB-INF/jsp/Etudiant/listInscription.jsp

        } else if ("enseignant".equals(utilisateur.getRole())) {
            String enseignantEmail = utilisateur.getEmail();
            inscriptions = inscriptionDAO.findByEnseignant(enseignantEmail);
            model.addAttribute("inscriptions", inscriptions);
            return "Enseignant/listInscriptions"; // Correspond à /WEB-INF/jsp/Enseignant/listInscriptions.jsp

        } else {
            model.addAttribute("errorMessage", "Accès non autorisé");
            return "error"; // Vue pour afficher une erreur d'accès
        }
    }
}
