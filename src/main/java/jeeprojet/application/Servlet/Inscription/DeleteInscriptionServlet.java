package jeeprojet.application.Servlet.Inscription;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.InscriptionDAO;

import java.io.IOException;

@WebServlet("/DeleteInscriptionServlet")
public class DeleteInscriptionServlet extends HttpServlet {
    private InscriptionDAO inscriptionDAO;

    @Override
    public void init() {
        inscriptionDAO = new InscriptionDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les paramètres d'inscription
        String etudiantEmail = request.getParameter("etudiantEmail");
        String matiereNom = request.getParameter("matiere");


        if (etudiantEmail == null || matiereNom == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Paramètres invalides pour la suppression");
            return;
        }

        // Supprimer l'inscription
        boolean deleted = inscriptionDAO.deleteInscription(etudiantEmail, matiereNom);
        if (!deleted) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Échec de la suppression de l'inscription");
            return;
        }

        // Redirection vers la liste des inscriptions
        response.sendRedirect("ListInscriptionServlet");
    }
}
