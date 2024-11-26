package jeeprojet.application.Servlet.Connection;
import jeeprojet.application.Modele.DAO.*;

import jeeprojet.application.Modele.Utilisateur;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
@WebServlet("/auth")
public class AuthServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération des informations soumises dans le formulaire de connexion
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Vérification si les champs sont remplis
        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            // Redirection en cas de champs vides
            response.sendRedirect("index.jsp?error=empty");
            return;
        }

        // Instancier le DAO pour l'utilisateur
        UtilisateurDAO utilisateurDAO = new UtilisateurDAO();

        // Chercher l'utilisateur dans la base de données par son pseudo
        Utilisateur utilisateur = utilisateurDAO.findByPseudo(username);

        // Vérifier si l'utilisateur existe et si le mot de passe est correct
        if (utilisateur != null && utilisateur.getMotDePasse().equals(password)) {
            // Connexion réussie : redirection vers la page etudiant.jsp
            request.getSession().setAttribute("user", utilisateur);
            response.sendRedirect("redirectionServlet");
        } else {
            // Identifiants incorrects : redirection avec erreur
            response.sendRedirect("index.jsp?error=invalid");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Afficher la page de connexion en GET
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}