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
import jeeprojet.application.Modele.DAO.UtilisateurDAO;
import jeeprojet.application.Modele.Resultat;
import jeeprojet.application.Modele.Utilisateur;
import jeeprojet.application.Util.HibernateUtil;

@WebServlet("/ResultatsParEtudiantServlet")
public class ResultatsParEtudiantServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String etudiantEmail = request.getParameter("etudiantEmail");

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            UtilisateurDAO utilisateurDAO = new UtilisateurDAO();
            ResultatDAO resultatDAO = new ResultatDAO();

            // Vérification de l'existence de l'étudiant
            Utilisateur etudiant = utilisateurDAO.findById(etudiantEmail);
            if (etudiant == null) {
                request.setAttribute("error", "Étudiant introuvable.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // Récupération des résultats
            List<Resultat> resultats = resultatDAO.consulterResultatsParEtudiant(etudiant);

            // Envoi des données à la JSP
            request.setAttribute("etudiant", etudiant);
            request.setAttribute("resultats", resultats);
            request.getRequestDispatcher("resultatsParEtudiant.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Erreur lors de la consultation des résultats par étudiant.", e);
        }
    }
}
