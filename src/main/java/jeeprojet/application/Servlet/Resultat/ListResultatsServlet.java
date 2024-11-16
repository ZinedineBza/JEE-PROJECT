package jeeprojet.application.Servlet.Resultat;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.ResultatDAO;
import jeeprojet.application.Modele.Resultat;

import java.io.IOException;
import java.util.List;

@WebServlet("/listResultats")
public class ListResultatsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResultatDAO resultatDAO = new ResultatDAO();
        List<Resultat> resultats = resultatDAO.getAll();
        request.setAttribute("resultats", resultats);
        RequestDispatcher dispatcher = request.getRequestDispatcher("listResultats.jsp");
        dispatcher.forward(request, response);
    }
}
