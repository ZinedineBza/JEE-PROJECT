package jeeprojet.application.Servlet.Connection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer la session actuelle et invalider la session si elle existe
        if (request.getSession(false) != null) {
            request.getSession().invalidate(); // Invalider la session (déconnexion)
        }

        // Redirection vers la page de connexion
        response.sendRedirect("index.jsp"); // Redirige vers la page de connexion
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Le comportement de la déconnexion est le même en GET et POST
        doPost(request, response);
    }
}
