package jeeprojet.application.Servlet.Resultat;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.ResultatDAO;
import jeeprojet.application.Modele.Resultat;

@WebServlet("/listResultats")
public class ListResultatsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Initialisation du DAO
        ResultatDAO resultatDAO = new ResultatDAO();

        // Récupération de tous les résultats
        List<Resultat> resultats = resultatDAO.getAll();

        // Debugging : afficher la taille de la liste
        System.out.println("Nombre de résultats récupérés : " + resultats.size());

        // Envoi des résultats à la JSP
        request.setAttribute("resultats", resultats);
        request.getRequestDispatcher("Admin/ResultatList.jsp").forward(request, response);
    }
}
