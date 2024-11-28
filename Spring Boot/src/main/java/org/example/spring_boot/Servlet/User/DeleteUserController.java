package org.example.spring_boot.Servlet.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class DeleteUserController {

    private final UtilisateurDAO utilisateurDAO;

    public DeleteUserController(UtilisateurDAO utilisateurDAO) {
        this.utilisateurDAO = utilisateurDAO;
    }

    @GetMapping("/user/delete")
    public String deleteUser(
            @RequestParam("email") String email,
            HttpSession session) {
        // Vérifier si l'utilisateur connecté est un administrateur
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("user");
        if (utilisateur != null && "admin".equals(utilisateur.getRole())) {
            // Rechercher l'utilisateur par email
            Utilisateur user = utilisateurDAO.findById(email);
            if (user != null) {
                utilisateurDAO.supprimer(user);
                System.out.println("Utilisateur supprimé : " + user);
            } else {
                System.out.println("Utilisateur introuvable pour l'email : " + email);
            }
        } else {
            System.out.println("Accès non autorisé.");
        }

        // Rediriger vers la page principale de l'administrateur
        return "redirect:/admin/main";
    }
}
