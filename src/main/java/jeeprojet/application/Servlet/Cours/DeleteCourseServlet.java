package jeeprojet.application.Servlet.Cours;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.CoursDAO;
import jeeprojet.application.Modele.Cour;
import jeeprojet.application.Modele.CourId;
import jeeprojet.application.Modele.Utilisateur;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Objects;

@WebServlet("/deleteCourse")
public class DeleteCourseServlet extends HttpServlet {

    private CoursDAO coursDAO;

    public void init() {
        coursDAO = new CoursDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération des paramètres envoyés dans la requête
        String enseignantEmail = request.getParameter("enseignantEmail");
        String date = (request.getParameter("date"));
        String horaire = (request.getParameter("horaire"));
        Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");
        System.out.println("Enseignant email: " + enseignantEmail);
        System.out.println("Date: " + date);
        System.out.println("Horaire: " + horaire);
        // Création de l'ID composite pour identifier le cours
        CourId courId = new CourId();
        courId.setEnseignant(enseignantEmail);
        courId.setDate(date);
        courId.setHoraire(horaire);
        if (Objects.equals(utilisateur.getRole(), "admin")) {
            // Recherche du cours avec l'ID composite
            Cour cours = coursDAO.findById(courId);

            if (cours != null) {
                // Si le cours est trouvé, on le supprime
                coursDAO.delete(cours);
            }

            // Redirection vers la liste des cours après suppression
            response.sendRedirect(request.getContextPath() +"/GetMatiere");
        }
    }
}
