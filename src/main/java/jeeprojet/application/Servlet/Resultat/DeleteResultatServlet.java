package jeeprojet.application.Servlet.Resultat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.ResultatDAO;
import jeeprojet.application.Modele.ResultatId;

import java.io.IOException;

@WebServlet("/deleteResultat")
public class DeleteResultatServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResultatDAO resultatDAO = new ResultatDAO();

        ResultatId id = new ResultatId();
        id.setEtudiant(request.getParameter("etudiant"));
        id.setCours(request.getParameter("cours"));

        jeeprojet.application.Modele.Resultat resultat = resultatDAO.get(id);
        if (resultat != null) {
            resultatDAO.delete(resultat);
        }

        response.sendRedirect("listResultats");
    }
}
