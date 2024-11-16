package jeeprojet.application.Servlet.User;

import jeeprojet.application.Modele.DAO.UtilisateurDAO;
import jeeprojet.application.Modele.Utilisateur;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

@WebServlet("/listUsers")
public class ListUsersServlet extends HttpServlet {

    private UtilisateurDAO utilisateurDAO;
    private final static Logger LOGGER = Logger.getLogger(ListUsersServlet.class.getName());

    public void init() {
        utilisateurDAO = new UtilisateurDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LOGGER.info("doGet method called");
        List<Utilisateur> listUsers = utilisateurDAO.findAll();
        if (listUsers != null) {
            LOGGER.info("Number of users found: " + listUsers.size());
        } else {
            LOGGER.warning("No users found");
        }
        request.setAttribute("listUsers", listUsers);
        request.getRequestDispatcher("User/listUsers.jsp").forward(request, response);
    }
}
