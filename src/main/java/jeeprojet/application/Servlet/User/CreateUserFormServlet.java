// ExempleServlet.java
package jeeprojet.application.Servlet.User;

import jakarta.servlet.annotation.WebServlet;
import jeeprojet.application.Modele.Classe;
import jeeprojet.application.Modele.DAO.ClasseDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.UtilisateurDAO;
import jeeprojet.application.Modele.Utilisateur;
import jeeprojet.application.Util.GMailer;
import jeeprojet.application.Util.GenerateUser;
import org.apache.taglibs.standard.tag.common.xml.ParseSupport;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@WebServlet("/FormUser")
public class CreateUserFormServlet extends HttpServlet {
    private UtilisateurDAO utilisateurDAO;
    private ClasseDAO classeDAO;

    public void init() {
        utilisateurDAO = new UtilisateurDAO();
        classeDAO = new ClasseDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Classe> classes = classeDAO.findAll();

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
            request.setAttribute("classes", classes);
            request.getRequestDispatcher("Admin/createEtudiant.jsp").forward(request, response);
            return;
        }

        Utilisateur utilisateur1 = (Utilisateur) request.getSession().getAttribute("user");
        if (Objects.equals(utilisateur1.getRole(), "admin")) {
            GenerateUser generateUser = new GenerateUser();
            String pseudo = generateUser.generatePseudo(prenom, nom);
            String motDePasse = null;
            try {
                motDePasse = generateUser.generateSecurePassword(pseudo, email);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

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
        String type = request.getParameter("type");
        
        if ("etudiant".equalsIgnoreCase(type)) {
            // Récupérer les classes pour les étudiants
            ClasseDAO classeDAO = new ClasseDAO();
            List<Classe> classes = classeDAO.findAll();

            request.setAttribute("classes", classes);
            request.setAttribute("type", "etudiant");
            request.getRequestDispatcher("/Admin/createEtudiant.jsp").forward(request, response);
        } else if ("enseignant".equalsIgnoreCase(type)) {
            request.setAttribute("type", "enseignant");
            request.getRequestDispatcher("/Admin/createEnseignant.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }
}