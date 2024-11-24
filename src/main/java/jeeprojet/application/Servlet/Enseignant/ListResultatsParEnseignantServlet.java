package jeeprojet.application.Servlet.Enseignant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.ResultatDAO;
import jeeprojet.application.Modele.Resultat;
import jeeprojet.application.Modele.Utilisateur;

import java.io.IOException;
import java.util.List;

@WebServlet("/listResultatsEnseignant")
public class ListResultatsParEnseignantServlet extends HttpServlet {

    private ResultatDAO resultatDAO;

    @Override
    public void init() {
        resultatDAO = new ResultatDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Récupération de l'utilisateur connecté
            Utilisateur enseignant = (Utilisateur) request.getSession().getAttribute("user");

            if (enseignant == null) {
                // Rediriger vers la page de connexion si l'utilisateur n'est pas connecté
                response.sendRedirect(request.getContextPath() + "/index.jsp");
                return;
            }

            String enseignantEmail = enseignant.getEmail();
            System.out.println("Email de l'enseignant : " + enseignantEmail);

            // Récupération des résultats pour l'enseignant
            List<Resultat> resultats = resultatDAO.findResultatByEnseignant(enseignantEmail);
            for (Resultat resultat : resultats) {
                System.out.println("Résultat : " + resultat.getEtudiant().getNom() + " - " +
                                   resultat.getCours().getNom() + " - " +
                                   resultat.getNote());
            }
            
            System.out.println("Nombre de résultats : " + resultats.size());

            // Passage des résultats à la JSP
            request.setAttribute("resultats", resultats);

            // Affichage de la page JSP
            request.getRequestDispatcher("/Enseignant/listResultatsEnseignant.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            // Rediriger vers une page d'erreur
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}
