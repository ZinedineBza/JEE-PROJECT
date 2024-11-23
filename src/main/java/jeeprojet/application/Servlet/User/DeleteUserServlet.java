package jeeprojet.application.Servlet.User;
import jeeprojet.application.Modele.DAO.UtilisateurDAO;
import jeeprojet.application.Modele.Utilisateur;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Objects;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {

    private UtilisateurDAO utilisateurDAO;

    public void init() {
        utilisateurDAO = new UtilisateurDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");
        if (Objects.equals(utilisateur.getRole(), "admin")) {

            String email = request.getParameter("email");

            utilisateur = utilisateurDAO.findById(email);
            utilisateurDAO.delete(utilisateur);

            response.sendRedirect("listUsers");
        }
    }
}


