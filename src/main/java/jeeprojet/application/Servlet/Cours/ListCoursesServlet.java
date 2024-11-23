package jeeprojet.application.Servlet.Cours;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.CoursDAO;
import jeeprojet.application.Modele.Cour;
import jeeprojet.application.Modele.Utilisateur;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

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

        Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");
        System.out.println(utilisateur.getRole());

        if (Objects.equals(utilisateur.getRole(), "admin")) {
            List<Cour> listCourses = coursDAO.findAll();
            request.setAttribute("listCourses", listCourses);
            request.getRequestDispatcher("Admin/listCourses.jsp").forward(request, response);
        }

    }
}
