package jeeprojet.application.Servlet.Connection;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.Cour;
import jeeprojet.application.Modele.DAO.CoursDAO;
import jeeprojet.application.Modele.Utilisateur;

@WebServlet("/redirectionServlet")
public class RedirectionServlet extends HttpServlet {

    private CoursDAO coursDAO;

    @Override
    public void init() {
        coursDAO = new CoursDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Récupérer l'utilisateur connecté depuis la session
        Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");

        // Vérifier si l'utilisateur est connecté
        if (utilisateur == null) {
            // Redirection vers la page de connexion si l'utilisateur n'est pas connecté
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=notLoggedIn");
            return;
        }

        // Redirection en fonction du rôle de l'utilisateur
        String role = utilisateur.getRole();

        if (Objects.equals(role, "admin")) {
            // Redirection pour les administrateurs
            request.getRequestDispatcher("Admin/Main.jsp").forward(request, response);

        } else if (Objects.equals(role, "enseignant")) {
            List<Cour> coursEtudiant = coursDAO.findByUtilisateur(utilisateur.getEmail());
            request.setAttribute("coursEtudiant", coursEtudiant);
            // Exemple : Redirection pour les enseignants (ajouter votre logique ici)
            request.getRequestDispatcher("Enseignant/index.jsp").forward(request, response);

        } else if (Objects.equals(role, "etudiant")) {
            // Récupérer les cours associés à l'étudiant
            List<Cour> coursEtudiant = coursDAO.findByUtilisateur(utilisateur.getEmail());
            request.setAttribute("coursEtudiant", coursEtudiant);

            // Redirection pour les étudiants
            request.getRequestDispatcher("Etudiant/index.jsp").forward(request, response);

        } else {
            // Gestion des rôles non prévus
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=unknownRole");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Déléguer le traitement POST vers GET
        doGet(request, response);
    }
}
