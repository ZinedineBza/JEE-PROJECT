package jeeprojet.application.Servlet.Notes;
import java.io.IOException;

import org.hibernate.Session;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.ResultatDAO;
import jeeprojet.application.Modele.Matiere;
import jeeprojet.application.Util.HibernateUtil;

@WebServlet("/MoyenneParCoursServlet")
public class MoyenneParCoursServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nomCours = request.getParameter("nomCours");

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Matiere cours = session.get(Matiere.class, nomCours);
            if (cours == null) {
                request.setAttribute("error", "Cours introuvable.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            ResultatDAO resultatDAO = new ResultatDAO();
            Double moyenne = resultatDAO.calculerMoyenneParCours(cours);

            request.setAttribute("cours", cours);
            request.setAttribute("moyenne", moyenne);
            request.getRequestDispatcher("moyenneParCours.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Erreur lors du calcul de la moyenne.", e);
        }
    }
}
