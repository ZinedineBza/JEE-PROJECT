package jeeprojet.application.Servlet.User;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.UtilisateurDAO;
import jeeprojet.application.Modele.Utilisateur;
import org.hibernate.resource.beans.container.spi.BeanLifecycleStrategy;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/createUser")
public class CreateUserServlet extends HttpServlet {

    private UtilisateurDAO utilisateurDAO;

    public void init() {
        utilisateurDAO = new UtilisateurDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pseudo = request.getParameter("pseudo");
        String motDePasse = request.getParameter("motDePasse");
        String role = request.getParameter("role");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String dateNaissanceStr = request.getParameter("dateNaissance");
        String email = request.getParameter("email");

        Map<String, String> errors = new HashMap<>();

        // Validation des données
        if (pseudo == null || pseudo.trim().isEmpty()) {
            errors.put("pseudo", "Le pseudo est obligatoire.");
        }
        if (motDePasse == null || motDePasse.trim().isEmpty()) {
            errors.put("motDePasse", "Le mot de passe est obligatoire.");
        } else if (!isPasswordSecure(motDePasse)){
            errors.put("motDePasee", "Le mot de passe est pas assez sécurisé.");
        }
        if (role == null || role.trim().isEmpty()) {
            errors.put("role", "Le role est obligatoire.");
        }
        if (nom == null || nom.trim().isEmpty()) {
            errors.put("nom", "Le nom est obligatoire.");
        }
        if (prenom == null || prenom.trim().isEmpty()) {
            errors.put("prenom","Le prenom est obligatoire.");
        }

        if (email == null || email.trim().isEmpty()) {
            errors.put("email", "L'email est obligatoire.");
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date dateNaissance = null;
        try {
            dateNaissance = dateFormat.parse(dateNaissanceStr);
        } catch (ParseException e) {
            errors.put("dateNaissance", "La date de naissance n'est pas valide.");
        }

        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("createUser.jsp").forward(request, response);
            return;
        }

        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setPseudo(pseudo);
        utilisateur.setMotDePasse(motDePasse);
        utilisateur.setRole(role);
        utilisateur.setNom(nom);
        utilisateur.setPrenom(prenom);
        utilisateur.setDateNaissance(dateNaissance);
        utilisateur.setEmail(email);

        utilisateurDAO.save(utilisateur);

        response.sendRedirect("listUsers");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("User/createUser.jsp").forward(request, response);
    }


private boolean isPasswordSecure(String password) {
    if (password == null || password.length() < 8) {
        return false;
    }

    boolean hasUppercase = false;
    boolean hasLowercase = false;
    boolean hasDigit = false;
    boolean hasSpecialChar = false;
    String specialChars = "!@#$%^&*()_-+=<>?/{}~|";

    for (char c : password.toCharArray()) {
        if (Character.isUpperCase(c)) {
            hasUppercase = true;
        } else if (Character.isLowerCase(c)) {
            hasLowercase = true;
        } else if (Character.isDigit(c)) {
            hasDigit = true;
        } else if (specialChars.indexOf(c) >= 0) {
            hasSpecialChar = true;
        }
    }

    return hasUppercase && hasLowercase && hasDigit && hasSpecialChar;
}
}
