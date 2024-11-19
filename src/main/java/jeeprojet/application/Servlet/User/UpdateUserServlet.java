package jeeprojet.application.Servlet.User;

import jeeprojet.application.Modele.DAO.UtilisateurDAO;
import jeeprojet.application.Modele.Utilisateur;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {

    private UtilisateurDAO utilisateurDAO;

    public void init() {
        utilisateurDAO = new UtilisateurDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");
        String role = request.getParameter("role");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String dateNaissanceStr = request.getParameter("dateNaissance");
        Utilisateur utilisateur= (Utilisateur) request.getSession().getAttribute("user");


        if (Objects.equals(utilisateur.getRole(), "admin")) {
            utilisateur = utilisateurDAO.findById(email);
            utilisateur.setMotDePasse(motDePasse);
            utilisateur.setRole(role);
            utilisateur.setNom(nom);
            utilisateur.setPrenom(prenom);
            utilisateur.setDateNaissance(dateNaissanceStr);
            utilisateurDAO.update(utilisateur);

            response.sendRedirect("listUsers");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        Utilisateur existingUser = utilisateurDAO.findById(email);
        request.setAttribute("user", existingUser);
        request.getRequestDispatcher("updateUser.jsp").forward(request, response);
    }
}
