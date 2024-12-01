package jeeprojet.application.Servlet.Cours;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.Cour;
import jeeprojet.application.Modele.CourId;
import jeeprojet.application.Modele.DAO.CoursDAO;
import jeeprojet.application.Modele.DAO.MatiereDAO;
import jeeprojet.application.Modele.DAO.UtilisateurDAO;
import jeeprojet.application.Modele.Matiere;
import jeeprojet.application.Modele.Utilisateur;

import java.io.IOException;
import java.sql.SQLOutput;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.*;

@WebServlet("/createCourse")
public class CreateCourseServlet extends HttpServlet {
    private MatiereDAO matiereDAO;
    private CoursDAO coursDAO;
    private UtilisateurDAO utilisateurDAO;

    public void init() {
        coursDAO = new CoursDAO();
        matiereDAO = new MatiereDAO();
        utilisateurDAO = new UtilisateurDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération des paramètres du formulaire
        String enseignantMail = request.getParameter("emailProf");
        String nomMatiere = request.getParameter("nom");
        String salle = request.getParameter("salle");
        String date = request.getParameter("date");
        String horaire = request.getParameter("horaire");

        // Initialisation des erreurs
        Map<String, String> errors = new HashMap<>();

        // Vérification de l'enseignant
        UtilisateurDAO utilisateurDAO = new UtilisateurDAO();
        Utilisateur enseignant = utilisateurDAO.findById(enseignantMail);
        Utilisateur isEnseignant = utilisateurDAO.findByIdEnseignant(enseignantMail);

        if (enseignant == null) {
            // Ajouter une erreur si l'enseignant n'existe pas
            errors.put("enseignantMail", "L'email renseigné n'est pas attribué. Veuillez réessayer.");
        }
        if (isEnseignant == null) {
            // Ajouter une erreur si l'enseignant n'existe pas
            errors.put("enseignantMail", "L'email renseigné n'appartient pas à un enseignant. Veuillez réessayer.");
        }
        // Si des erreurs existent, rediriger vers la page avec les erreurs
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);

            // Repasser les données pour réafficher le formulaire avec les champs préremplis
            request.setAttribute("emailProf", enseignantMail);
            request.setAttribute("nom", nomMatiere);
            request.setAttribute("salle", salle);
            request.setAttribute("date", date);
            request.setAttribute("horaire", horaire);

            // Repasser la liste des matières
            List<Matiere> coursList = matiereDAO.findAll();

            request.setAttribute("coursList", coursList);

            // Rediriger vers la page
            request.getRequestDispatcher("/Admin/createCourse.jsp").forward(request, response);
            return;
        }

        // Création du cours si aucune erreur
        CourId coursId = new CourId();
        coursId.setDate(date);
        coursId.setHoraire(horaire);
        coursId.setEnseignant(enseignantMail);

        Matiere matiere = new Matiere();
        matiere.setNom(nomMatiere);

        Cour cours = new Cour();
        cours.setId(coursId);
        cours.setEnseignant(enseignant);
        cours.setNom(matiere);
        cours.setSalle(salle);

        coursDAO.save(cours);

        // Redirection après succès
        response.sendRedirect("GetMatiere");
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Matiere> coursList = matiereDAO.findAll();
        List<Utilisateur> utilisateursList = utilisateurDAO.findAllByRole("enseignant");
        request.setAttribute("enseignant", utilisateursList);
        request.setAttribute("coursList", coursList);
        request.getRequestDispatcher("/Admin/createCourse.jsp").forward(request, response);
    }
}
