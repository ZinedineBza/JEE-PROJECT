package jeeprojet.application.Servlet.Connection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.Cour;
import jeeprojet.application.Modele.Utilisateur;
import jeeprojet.application.Modele.DAO.CoursDAO;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

@WebServlet("/redirectionServlet")
public class RedirectionServlet extends HttpServlet {

    private CoursDAO coursDAO;

    @Override
    public void init() {
        coursDAO = new CoursDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");

        if (Objects.equals(utilisateur.getRole(), "admin")) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
    }
        else {
        List<Cour> listCourses = coursDAO.findByUtilisateur(utilisateur.getEmail());
        request.setAttribute("listCourses", listCourses);
        request.getRequestDispatcher("Etudiant/index.jsp").forward(request, response);
    }
}
}
