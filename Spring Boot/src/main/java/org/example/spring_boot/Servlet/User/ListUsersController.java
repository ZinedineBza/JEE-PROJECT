package org.example.spring_boot.Servlet.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ListUsersController {

    private final UtilisateurDAO utilisateurDAO;

    public ListUsersController(UtilisateurDAO utilisateurDAO) {
        this.utilisateurDAO = utilisateurDAO;
    }

    @GetMapping("/user/list")
    public String listUsers(
            @RequestParam("recherche") String roleRecherche,
            HttpSession session,
            Model model) {

        // Récupérer l'utilisateur connecté
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("user");

        if (utilisateur != null && "admin".equals(utilisateur.getRole())) {
            // Récupérer les utilisateurs ayant le rôle spécifié
            List<Utilisateur> listUsers = utilisateurDAO.findByRole(roleRecherche);

            // Ajouter les données au modèle pour la vue
            model.addAttribute("listUsers", listUsers);
            model.addAttribute("recherche", roleRecherche);

            return "Admin/listUsers"; // Correspond à /WEB-INF/jsp/Admin/listUsers.jsp
        }

        // Si l'utilisateur n'est pas un administrateur, rediriger vers la page d'accueil
        return "redirect:/index";
    }
}
