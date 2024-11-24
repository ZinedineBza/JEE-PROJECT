package jeeprojet.application.Servlet.Inscription;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jeeprojet.application.Modele.DAO.InscriptionDAO;
import jeeprojet.application.Modele.InscriptionId;
import jeeprojet.application.Modele.Utilisateur;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Objects;

@WebServlet("/DeleteInscriptionServlet")
public class DeleteInscriptionServlet extends HttpServlet {
    private InscriptionDAO inscriptionDAO;

    @Override
    public void init() {
        inscriptionDAO = new InscriptionDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération de l'email de l'étudiant et de la date de l'inscription (si disponibles dans la requête)
        String etudiantEmail = request.getParameter("etudiantEmail");
        String dateInscription = request.getParameter("dateInscription");  // Assure-toi que cette valeur est bien passée dans l'URL

        Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");

        // Vérification du rôle de l'utilisateur
        if (Objects.equals(utilisateur.getRole(), "admin")) {
            // Création de l'ID composite
            InscriptionId id = new InscriptionId();
            id.setEtudiant(etudiantEmail);
            id.setDateInscription(dateInscription);

            // Suppression de l'inscription
            inscriptionDAO.delete(id);

            // Redirection vers la liste des inscriptions
            response.sendRedirect("ListInscriptionServlet");
        } else {
            // Si l'utilisateur n'est pas un admin, redirection ou message d'erreur
            response.sendRedirect("unauthorized.jsp");
        }
    }
}
