package org.example.spring_boot.Servlet.Connection;
import jakarta.servlet.http.HttpSession;
import org.example.spring_boot.Modele.DAO.UtilisateurRepository;
import org.example.spring_boot.Modele.Utilisateur;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {

    private final UtilisateurRepository utilisateurDAO;

    public AuthController(UtilisateurRepository utilisateurDAO) {
        this.utilisateurDAO = utilisateurDAO; // Injection du DAO
    }

    @GetMapping("/")
    public String showLoginPage(@RequestParam(value = "error", required = false) String errorMessage, Model model) {
        model.addAttribute("errorMessage", errorMessage); // Ajout du message d'erreur au modèle
        return "index"; // Renvoie vers /WEB-INF/jsp/index.jsp
    }

    @PostMapping("/auth")
    public String authenticateUser(@RequestParam("username") String username,
                                   @RequestParam("password") String password,
                                   HttpSession session, Model model) {
        // Vérification des champs
        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            return "redirect:/?error=empty";
        }

        // Recherche de l'utilisateur
        Utilisateur utilisateur = utilisateurDAO.findByPseudo(username);

        // Vérification des identifiants
        if (utilisateur != null && utilisateur.getMotDePasse().equals(password)) {
            // Connexion réussie
            session.setAttribute("user", utilisateur);
            return "redirect:/redirection";
        } else {
            // Identifiants invalides
            return "redirect:/?error=invalid";
        }
    }
}
