package jeeprojet.application.Servlet.Cours;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.CoursDAO;
import jeeprojet.application.Modele.Cour;
import jeeprojet.application.Modele.CourId;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet("/deleteCourse")
public class DeleteCourseServlet extends HttpServlet {

    private CoursDAO coursDAO;

    public void init() {
        coursDAO = new CoursDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération des paramètres envoyés dans la requête
        String enseignantEmail = request.getParameter("enseignantEmail");
        String date = (request.getParameter("date"));
        String horaire = (request.getParameter("horaire"));

        // Création de l'ID composite pour identifier le cours
        CourId courId = new CourId();
        courId.setEnseignant(enseignantEmail);
        courId.setDate(date);
        courId.setHoraire(horaire);

        // Recherche du cours avec l'ID composite
        Cour cours = coursDAO.findById(courId);

        if (cours != null) {
            // Si le cours est trouvé, on le supprime
            coursDAO.delete(cours);
        }

        // Redirection vers la liste des cours après suppression
        response.sendRedirect("listCourses");
    }
}
