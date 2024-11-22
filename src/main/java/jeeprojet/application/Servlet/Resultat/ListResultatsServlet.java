package jeeprojet.application.Servlet.Resultat;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.ResultatDAO;
import jeeprojet.application.Modele.Resultat;
import jeeprojet.application.Modele.Utilisateur;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@WebServlet("/listResultats")
public class ListResultatsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResultatDAO resultatDAO = new ResultatDAO();
        Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");
        List<Resultat> resultats = new ArrayList<>();
        if (Objects.equals(utilisateur.getRole(), "admin")) {
            resultats = resultatDAO.getAll();
        }else {
            resultats = resultatDAO.findByUser(utilisateur);
        }
        request.setAttribute("resultats", resultats);
        request.getRequestDispatcher("Admin/ResultatList.jsp").forward(request, response);
    }
}

