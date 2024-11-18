package jeeprojet.application.Servlet.Notes;

import java.io.IOException;
import java.util.List;

import org.hibernate.Session;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.ResultatDAO;
import jeeprojet.application.Modele.DAO.UtilisateurDAO;
import jeeprojet.application.Modele.Resultat;
import jeeprojet.application.Modele.Utilisateur;
import jeeprojet.application.Util.HibernateUtil;

public class ReleveDeNotesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            ResultatDAO resultatDAO = new ResultatDAO(session);
            UtilisateurDAO utilisateurDAO = new UtilisateurDAO();

            String etudiantEmail = request.getParameter("etudiantEmail");

            // Récupérer l'utilisateur
            Utilisateur etudiant = utilisateurDAO.findById(etudiantEmail);
            if (etudiant == null) {
                request.setAttribute("error", "Utilisateur introuvable.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // Récupération des données
            List<Resultat> releveDeNotes = resultatDAO.genererReleveDeNotes(etudiant);
            Double moyenne = resultatDAO.calculerMoyenneParEtudiant(etudiant);

            // Envoi des données à la JSP
            request.setAttribute("etudiant", etudiant);
            request.setAttribute("releveDeNotes", releveDeNotes);
            request.setAttribute("moyenne", moyenne);
            request.getRequestDispatcher("releveDeNotes.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Erreur lors du traitement de la requête.", e);
        }
    }
}
