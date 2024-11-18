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
import jeeprojet.application.Modele.Matiere;
import jeeprojet.application.Modele.Resultat;
import jeeprojet.application.Util.HibernateUtil;

@WebServlet("/ResultatsParCoursServlet")
public class ResultatsParCoursServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nomCours = request.getParameter("nomCours");

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            ResultatDAO resultatDAO = new ResultatDAO();

            // Vérification de l'existence du cours
            Matiere cours = session.get(Matiere.class, nomCours);
            if (cours == null) {
                request.setAttribute("error", "Cours introuvable.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // Récupération des résultats
            List<Resultat> resultats = resultatDAO.consulterResultatsParCours(cours);

            // Envoi des données à la JSP
            request.setAttribute("cours", cours);
            request.setAttribute("resultats", resultats);
            request.getRequestDispatcher("resultatsParCours.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Erreur lors de la consultation des résultats par cours.", e);
        }
    }
}
