package jeeprojet.application.Servlet.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jdk.jshell.execution.Util;
import jeeprojet.application.Modele.Classe;
import jeeprojet.application.Modele.DAO.ClasseDAO;
import jeeprojet.application.Modele.DAO.UtilisateurDAO;
import jeeprojet.application.Modele.Utilisateur;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@WebServlet("/createUser")
public class CreateUserServlet extends HttpServlet {

    private UtilisateurDAO utilisateurDAO;
    private ClasseDAO classeDAO;
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final String SPECIAL_CHARACTERS = "!@#$%^&*()_-+=<>?/{}~|";
    private static final int PSEUDO_LENGTH = 8;
    private static final int PASSWORD_LENGTH = 12;

    public void init() {
        utilisateurDAO = new UtilisateurDAO();
        classeDAO = new ClasseDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String role = request.getParameter("role");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String dateNaissanceStr = request.getParameter("dateNaissance");
        String email = request.getParameter("email");
        String classerecherche = request.getParameter("classe");

        Classe classe = classeDAO.findById(classerecherche);

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
        } else if (utilisateurDAO.emailExists(email)) {
            errors.put("email", "Cet email est déjà utilisé.");
        }
        if (dateNaissanceStr == null || dateNaissanceStr.trim().isEmpty()) {
            errors.put("dateNaissance", "La date de naissance n'est pas valide.");
        }

        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("Admin/createEtudiant.jsp").forward(request, response);
            return;
        }

        Utilisateur utilisateur1 = (Utilisateur) request.getSession().getAttribute("user");
        if (Objects.equals(utilisateur1.getRole(), "admin")) {
            String pseudo = generatePseudo(prenom, nom);
            String motDePasse = generateSecurePassword();

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

            response.sendRedirect("listUsers?recherche="+role);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Admin/createEtudiant.jsp").forward(request, response);
    }

    private String generatePseudo(String prenom, String nom) {
        String basePseudo = prenom.substring(0, 1) + nom.substring(0, Math.min(5, nom.length())).toLowerCase();
        String pseudo = basePseudo;
        int count = 1;

        while (utilisateurDAO.pseudoExists(pseudo)) {
            pseudo = basePseudo + count;
            count++;
        }

        return pseudo;
    }

    private String generateSecurePassword() {
        String password = generateRandomString(PASSWORD_LENGTH - 2);
        password += SPECIAL_CHARACTERS.charAt(new SecureRandom().nextInt(SPECIAL_CHARACTERS.length()));
        password += SPECIAL_CHARACTERS.charAt(new SecureRandom().nextInt(SPECIAL_CHARACTERS.length()));
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
