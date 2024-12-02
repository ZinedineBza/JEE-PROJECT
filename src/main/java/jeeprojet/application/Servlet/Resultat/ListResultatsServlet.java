package jeeprojet.application.Servlet.Resultat;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.MatiereDAO;
import jeeprojet.application.Modele.DAO.ResultatDAO;
import jeeprojet.application.Modele.Matiere;
import jeeprojet.application.Modele.Resultat;
import jeeprojet.application.Modele.Utilisateur;

@WebServlet("/listResultats")
public class ListResultatsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Initialisation du DAO
        ResultatDAO resultatDAO = new ResultatDAO();
        MatiereDAO matiereDAO = new MatiereDAO();

        // Récupérer l'utilisateur connecté
        Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");
        if (user == null) {
            // Rediriger vers la page de connexion si l'utilisateur n'est pas connecté
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        List<Resultat> resultats;

        // Vérification du rôle
        if (Objects.equals(user.getRole(), "enseignant")) {
            // Si c'est un enseignant, récupérer uniquement ses résultats
            resultats = resultatDAO.findResultatByEnseignant(user.getEmail());
            System.out.println("Enseignant connecté : " + user.getEmail());
        } else if (Objects.equals(user.getRole(), "admin")) {
            // Si c'est un administrateur, récupérer tous les résultats
            resultats = resultatDAO.getAll();
            System.out.println("Administrateur connecté : " + user.getEmail());
        } else {
            // Si l'utilisateur n'est ni administrateur ni enseignant, rediriger vers l'accueil
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }
        List<Matiere> matieres = matiereDAO.findAll();

        request.setAttribute("resultats", resultats);
        request.setAttribute("matieres", matieres);
        request.getRequestDispatcher("Admin/ResultatList.jsp").forward(request, response);
    }
}
