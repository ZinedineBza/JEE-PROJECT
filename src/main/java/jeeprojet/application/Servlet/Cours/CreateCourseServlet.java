package jeeprojet.application.Servlet.Cours;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.Cour;
import jeeprojet.application.Modele.CourId;
import jeeprojet.application.Modele.DAO.CoursDAO;
import jeeprojet.application.Modele.DAO.UtilisateurDAO;
import jeeprojet.application.Modele.Matiere;
import jeeprojet.application.Modele.Utilisateur;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;

@WebServlet("/createCourse")
public class CreateCourseServlet extends HttpServlet {

    private CoursDAO coursDAO;

    public void init() {
        coursDAO = new CoursDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération des paramètres du formulaire
        String enseignantMail = request.getParameter("emailProf");
        String nomMatiere = request.getParameter("nom");
        String salle = request.getParameter("salle");
        String date = request.getParameter("date");
        String horaire = request.getParameter("horaire");

        // Création de l'ID composite pour le cours
        CourId coursId = new CourId();
        coursId.setDate(date);
        coursId.setHoraire(horaire);
        coursId.setEnseignant(enseignantMail);

        // Création de l'objet Cour
        UtilisateurDAO utilisateurDAO = new UtilisateurDAO();
        Utilisateur enseignant = utilisateurDAO.findById(enseignantMail);

        if (enseignant == null) {
            throw new ServletException("Enseignant introuvable avec le mail : " + enseignantMail);
        }

        Matiere matiere = new Matiere();  // Il faudra également charger la Matière en fonction du nom depuis la base.
        matiere.setNom(nomMatiere);

        Cour cours = new Cour();
        cours.setId(coursId);
        cours.setEnseignant(enseignant);
        cours.setNom(matiere);
        cours.setSalle(salle);

        // Sauvegarde du cours dans la base de données
        coursDAO.save(cours);

        // Redirection vers la page de liste des cours
        response.sendRedirect("listCourses");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("createCourse.jsp").forward(request, response);
    }
}
