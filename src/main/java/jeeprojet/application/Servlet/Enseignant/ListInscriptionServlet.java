package jeeprojet.application.Servlet.Enseignant;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.Inscription;
import jeeprojet.application.Modele.Utilisateur;
import jeeprojet.application.Modele.DAO.InscriptionDAO;

@WebServlet("/ListInscriptionServlet")
public class ListInscriptionServlet extends HttpServlet {
    private InscriptionDAO inscriptionDAO;

    @Override
    public void init() throws ServletException {
        inscriptionDAO = new InscriptionDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer l'email de l'enseignant depuis la session
        String enseignantEmail = ((Utilisateur) request.getSession().getAttribute("user")).getEmail();

        // Récupérer les inscriptions liées aux cours de l'enseignant
        List<Inscription> inscriptions = inscriptionDAO.findByEnseignant(enseignantEmail);

        // Ajouter les données à la requête
        request.setAttribute("inscriptions", inscriptions);

        // Rediriger vers la JSP
        request.getRequestDispatcher("/Enseignant/listInscriptions.jsp").forward(request, response);
    }
}
