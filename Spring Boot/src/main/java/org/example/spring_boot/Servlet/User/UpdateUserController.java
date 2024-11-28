package org.example.spring_boot.Servlet.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class UpdateUserController {

    private final UtilisateurDAO utilisateurDAO;

    public UpdateUserController(UtilisateurDAO utilisateurDAO) {
        this.utilisateurDAO = utilisateurDAO;
    }

    @GetMapping("/user/update")
    public String showUpdateForm(
            @RequestParam("email") String email,
            Model model) {
        // Récupérer l'utilisateur existant
        Utilisateur existingUser = utilisateurDAO.findById(email);
        model.addAttribute("user", existingUser);
        return "Admin/updateUser"; // Correspond à /WEB-INF/jsp/Admin/updateUser.jsp
    }

    @PostMapping("/user/update")
    public String updateUser(
            @RequestParam("email") String email,
            @RequestParam("motDePasse") String motDePasse,
            @RequestParam("role") String role,
            @RequestParam("nom") String nom,
            @RequestParam("prenom") String prenom,
            @RequestParam("dateNaissance") String dateNaissanceStr,
            HttpSession session) {

        // Vérifier que l'utilisateur connecté est un administrateur
        Utilisateur utilisateurSession = (Utilisateur) session.getAttribute("user");
        if (utilisateurSession != null && "admin".equals(utilisateurSession.getRole())) {
            // Récupérer l'utilisateur existant
            Utilisateur utilisateur = utilisateurDAO.findById(email);

            if (utilisateur != null) {
                // Mettre à jour les informations de l'utilisateur
                utilisateur.setMotDePasse(motDePasse);
                utilisateur.setRole(role);
                utilisateur.setNom(nom);
                utilisateur.setPrenom(prenom);
                utilisateur.setDateNaissance(dateNaissanceStr);

                // Enregistrer les modifications
                utilisateurDAO.update(utilisateur);
            }
        }

        // Rediriger vers la liste des utilisateurs
        return "redirect:/user/list";
    }
}
