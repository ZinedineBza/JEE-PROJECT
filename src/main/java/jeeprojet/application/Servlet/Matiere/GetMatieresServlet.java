package jeeprojet.application.Servlet.Matiere;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.CoursDAO;
import jeeprojet.application.Modele.Cour;
import jeeprojet.application.Modele.DAO.MatiereDAO;
import jeeprojet.application.Modele.Matiere;
import jeeprojet.application.Modele.Utilisateur;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@WebServlet("/GetMatiere")
public class GetMatieresServlet extends HttpServlet {

    private MatiereDAO MatiereDAO;

    @Override
    public void init() {
        MatiereDAO = new MatiereDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération de la liste des cours depuis la base de données

        Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");
        System.out.println(utilisateur.getRole());

        if (Objects.equals(utilisateur.getRole(), "admin")) {
            List<Matiere> matieres = MatiereDAO.findAll();
            request.setAttribute("matieres", matieres);
            request.getRequestDispatcher("Admin/listCourses.jsp").forward(request, response);
        }

    }
}
