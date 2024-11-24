package jeeprojet.application.Servlet.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.UtilisateurDAO;
import jeeprojet.application.Modele.Utilisateur;

@WebServlet("/listUsers")
public class ListUsersServlet extends HttpServlet {

    private UtilisateurDAO utilisateurDAO;

    public void init() {
        utilisateurDAO = new UtilisateurDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paramValue = request.getParameter("recherche");
        List<Utilisateur> listUsers = new ArrayList<>();
        Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");
        if (Objects.equals(utilisateur.getRole(), "admin")) {
            listUsers = utilisateurDAO.findByRole(paramValue);
            request.setAttribute("listUsers", listUsers);
            request.getRequestDispatcher("Admin/listUsers.jsp").forward(request, response);
        }

    }
}

