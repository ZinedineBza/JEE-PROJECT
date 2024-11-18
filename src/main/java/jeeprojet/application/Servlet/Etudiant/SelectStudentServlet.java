package jeeprojet.application.Servlet.Etudiant;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.UtilisateurDAO;
import jeeprojet.application.Modele.Utilisateur;

@WebServlet("/selectStudent")
public class SelectStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UtilisateurDAO utilisateurDAO = new UtilisateurDAO();

        // Récupérer uniquement les utilisateurs ayant le rôle "ETUDIANT"
        List<Utilisateur> etudiants = utilisateurDAO.findByRole("ETUDIANT");

        // Ajouter les étudiants à la requête
        request.setAttribute("etudiants", etudiants);

        // Rediriger vers la page JSP
        request.getRequestDispatcher("/Etudiant/selectStudent.jsp").forward(request, response);
    }
}
