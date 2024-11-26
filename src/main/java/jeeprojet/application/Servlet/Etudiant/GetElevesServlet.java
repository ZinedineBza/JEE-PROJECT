package jeeprojet.application.Servlet.Etudiant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jdk.jshell.execution.Util;
import jeeprojet.application.Modele.Classe;
import jeeprojet.application.Modele.DAO.UtilisateurDAO;
import jeeprojet.application.Modele.Utilisateur;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/getEleves")
public class GetElevesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String matiereId = request.getParameter("matiereId");
        String classeId = request.getParameter("classeId");

        // Récupérer les élèves inscrits dans cette matière et classe
        List<Utilisateur> eleves = new ArrayList<>();
        if (matiereId != null && classeId != null) {
            UtilisateurDAO utilisateurDAO = new UtilisateurDAO();
            eleves = utilisateurDAO.findElevesByClasseAndMatiere(classeId, matiereId);
        }
        System.out.println(eleves);

        // Répondre avec des lignes de tableau HTML
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        StringBuilder rows = new StringBuilder();
        for (Utilisateur eleve : eleves) {
            rows.append("<tr><td>").append(eleve.getNom()).append("</td><td>").append(eleve.getPrenom()).append("</td></tr>");
        }

        response.getWriter().write(rows.toString());
    }
}
