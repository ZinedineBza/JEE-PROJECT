package jeeprojet.application.Servlet.Cours;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.CourId;
import jeeprojet.application.Modele.DAO.CoursDAO;
import jeeprojet.application.Modele.Cour;
import jeeprojet.application.Modele.Utilisateur;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

@WebServlet("/updateCourse")
public class UpdateCoursesServlet extends HttpServlet {

    private CoursDAO courDAO;

    public void init() {
        courDAO = new CoursDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String enseignantEmail = request.getParameter("enseignantEmail");
        String nomMatiere = request.getParameter("nomMatiere");
        String date = request.getParameter("date");
        String horaire = request.getParameter("horaire");
        String salle = request.getParameter("salle");
        Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");

        CourId courId = new CourId();
        courId.setEnseignant(enseignantEmail);

        courId.setDate(date);
        courId.setHoraire(horaire);

        if (Objects.equals(utilisateur.getRole(), "admin")) {
            Cour cours = courDAO.findById(courId);
            if (cours != null) {
                cours.setSalle(salle); // Met à jour la salle
                courDAO.update(cours);
            }
        }

        response.sendRedirect("listCourses");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String enseignantEmail = request.getParameter("enseignantEmail");
        String nomMatiere = request.getParameter("nomMatiere");
        String date = (request.getParameter("date"));
        String horaire = (request.getParameter("horaire"));

        CourId courId = new CourId();
        courId.setEnseignant(enseignantEmail);
        courId.setDate(date);
        courId.setHoraire(horaire);

        Cour cours = courDAO.findById(courId);
        request.setAttribute("cours", cours);
        request.getRequestDispatcher("updateCourse.jsp").forward(request, response);
    }
}

