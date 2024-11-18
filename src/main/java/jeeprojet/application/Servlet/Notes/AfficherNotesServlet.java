package jeeprojet.application.Servlet.Notes;

import java.io.IOException;
import java.util.List;

import org.hibernate.Session;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.ResultatDAO;
import jeeprojet.application.Modele.Resultat;
import jeeprojet.application.Util.HibernateUtil;

@WebServlet("/AfficherNotesServlet")
public class AfficherNotesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            ResultatDAO resultatDAO = new ResultatDAO();
            List<Resultat> resultats = resultatDAO.obtenirToutesLesNotes();

            request.setAttribute("resultats", resultats);
            request.getRequestDispatcher("afficherNotes.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Erreur lors de l'affichage des notes.", e);
        }
    }
}
