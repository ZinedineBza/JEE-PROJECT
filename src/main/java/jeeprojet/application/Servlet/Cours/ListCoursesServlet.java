package jeeprojet.application.Servlet.Cours;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.CoursDAO;
import jeeprojet.application.Modele.Cour;

import java.io.IOException;
import java.util.List;

@WebServlet("/listCourses")
public class ListCoursesServlet extends HttpServlet {

    private CoursDAO coursDAO;

    @Override
    public void init() {
        coursDAO = new CoursDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération de la liste des cours depuis la base de données
        List<Cour> listCourses = coursDAO.findAll();

        // Ajout de la liste des cours comme attribut de la requête
        request.setAttribute("listCourses", listCourses);

        // Redirection vers la page JSP pour afficher les cours
        request.getRequestDispatcher("listCourses.jsp").forward(request, response);
    }
}
