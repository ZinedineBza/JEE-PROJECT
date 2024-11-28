package org.example.spring_boot.Servlet.User;
import jakarta.servlet.http.HttpSession;
import org.example.spring_boot.Modele.Classe;
import org.example.spring_boot.Modele.DAO.ClasseRepository;
import org.example.spring_boot.Modele.DAO.UtilisateurRepository;
import org.example.spring_boot.Modele.Utilisateur;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;

@Controller
public class CreateUserController {

    private final UtilisateurRepository utilisateurDAO;
    private final ClasseRepository classeDAO;
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final String SPECIAL_CHARACTERS = "!@#$%^&*()_-+=<>?/{}~|";
    private static final int PASSWORD_LENGTH = 12;

    public CreateUserController(UtilisateurRepository utilisateurDAO, ClasseRepository classeDAO) {
        this.utilisateurDAO = utilisateurDAO;
        this.classeDAO = classeDAO;
    }

    @GetMapping("/user/create")
    public String showCreateUserForm(Model model) {
        model.addAttribute("classes", classeDAO.findAll());
        return "Admin/createEtudiant"; // Correspond à /WEB-INF/jsp/Admin/createEtudiant.jsp
    }

    @PostMapping("/user/create")
    public String createUser(
            @RequestParam("role") String role,
            @RequestParam("nom") String nom,
            @RequestParam("prenom") String prenom,
            @RequestParam("dateNaissance") String dateNaissanceStr,
            @RequestParam("email") String email,
            @RequestParam(value = "classe", required = false) String classeId,
            HttpSession session,
            Model model) {

        Map<String, String> errors = new HashMap<>();

        // Validation des données
        if (role == null || role.trim().isEmpty()) {
            errors.put("role", "Le rôle est obligatoire.");
        }
        if (nom == null || nom.trim().isEmpty()) {
            errors.put("nom", "Le nom est obligatoire.");
        }
        if (prenom == null || prenom.trim().isEmpty()) {
            errors.put("prenom", "Le prénom est obligatoire.");
        }
        if (email == null || email.trim().isEmpty()) {
            errors.put("email", "L'email est obligatoire.");
        } else if (utilisateurDAO.existsByEmail(email)) {
            errors.put("email", "Cet email est déjà utilisé.");
        }
        if (dateNaissanceStr == null || dateNaissanceStr.trim().isEmpty()) {
            errors.put("dateNaissance", "La date de naissance n'est pas valide.");
        }

        if (!errors.isEmpty()) {
            model.addAttribute("errors", errors);
            model.addAttribute("classes", classeDAO.findAll());
            return "Admin/createEtudiant";
        }

        Utilisateur utilisateur1 = (Utilisateur) session.getAttribute("user");
        if (Objects.equals(utilisateur1.getRole(), "admin")) {
            String pseudo = generatePseudo(prenom, nom);
            String motDePasse = generateSecurePassword();

            Optional<Classe> classe = classeId != null ? classeDAO.findById(classeId) : null;

            Utilisateur utilisateur = new Utilisateur();
            utilisateur.setPseudo(pseudo);
            utilisateur.setMotDePasse(motDePasse);
            utilisateur.setRole(role);
            utilisateur.setNom(nom);
            utilisateur.setPrenom(prenom);
            utilisateur.setDateNaissance(dateNaissanceStr);
            utilisateur.setEmail(email);
            utilisateur.setClasse(classe);

            utilisateurDAO.save(utilisateur);

            return "redirect:/user/list?recherche=" + role;
        }

        return "redirect:/index";
    }

    private String generatePseudo(String prenom, String nom) {
        String basePseudo = prenom.substring(0, 1) + nom.substring(0, Math.min(5, nom.length())).toLowerCase();
        String pseudo = basePseudo;
        int count = 1;

        while (utilisateurDAO.existsByPseudo(pseudo)) {
            pseudo = basePseudo + count;
            count++;
        }

        return pseudo;
    }

    private String generateSecurePassword() {
        String password = generateRandomString(PASSWORD_LENGTH - 2);
        SecureRandom random = new SecureRandom();
        password += SPECIAL_CHARACTERS.charAt(random.nextInt(SPECIAL_CHARACTERS.length()));
        password += SPECIAL_CHARACTERS.charAt(random.nextInt(SPECIAL_CHARACTERS.length()));
        return password;
    }

    private String generateRandomString(int length) {
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(CHARACTERS.charAt(random.nextInt(CHARACTERS.length())));
        }
        return sb.toString();
    }
}
