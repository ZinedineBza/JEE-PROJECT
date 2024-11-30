package jeeprojet.application.Servlet.Cours;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.*;
import jeeprojet.application.Modele.DAO.CoursDAO;
import jeeprojet.application.Modele.DAO.MatiereDAO;
import jeeprojet.application.Modele.DAO.SalleDAO;
import jeeprojet.application.Modele.DAO.UtilisateurDAO;

import java.io.IOException;
import java.util.*;

@WebServlet("/createCourse")
public class CreateCourseServlet extends HttpServlet {
    private MatiereDAO matiereDAO;
    private CoursDAO coursDAO;
    private UtilisateurDAO utilisateurDAO;
    private SalleDAO salleDAO;

    public void init() {
        coursDAO = new CoursDAO();
        matiereDAO = new MatiereDAO();
        utilisateurDAO = new UtilisateurDAO();
        salleDAO = new SalleDAO();
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
        Utilisateur enseignant = utilisateurDAO.findById(enseignantMail);
        Utilisateur isEnseignant = utilisateurDAO.findByIdEnseignant(enseignantMail);

        if (enseignant == null) {
            errors.put("enseignantMail", "L'email renseigné n'est pas attribué. Veuillez réessayer.");
        }
        if (isEnseignant == null) {
            errors.put("enseignantMail", "L'email renseigné n'appartient pas à un enseignant. Veuillez réessayer.");
        }

        // Si des erreurs existent, rediriger vers la page avec les erreurs
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.setAttribute("emailProf", enseignantMail);
            request.setAttribute("nom", nomMatiere);
            request.setAttribute("salle", salle);
            request.setAttribute("date", date);
            request.setAttribute("horaire", horaire);

            List<Matiere> coursList = matiereDAO.findAll();
            request.setAttribute("coursList", coursList);

            request.getRequestDispatcher("/Admin/createCourse.jsp").forward(request, response);
            return;
        }
        List<Matiere> coursList = matiereDAO.findAll();
        List<Utilisateur> utilisateursList = utilisateurDAO.findAllByRole("enseignant");
        List<Salle> salles = salleDAO.findAll();

        request.setAttribute("salle", salles);
        request.setAttribute("enseignant", utilisateursList);
        request.setAttribute("coursList", coursList);

        // Création du cours si aucune erreur
        CourId coursId = new CourId();
        coursId.setDate(date);
        coursId.setHoraire(horaire);
        coursId.setEnseignant(enseignantMail);
        Matiere matiere = matiereDAO.findById(nomMatiere);

        Cour cours = new Cour();
        cours.setId(coursId);
        cours.setEnseignant(enseignant);
        cours.setNom(matiere);
        cours.setSalle(salle);

        String conflictMessage = coursDAO.hasConflict(enseignantMail, salle, date, horaire);
        if (conflictMessage != null) {
            request.setAttribute("errors", conflictMessage);
            request.getRequestDispatcher("/Admin/createCourse.jsp").forward(request, response);
        } else {
            coursDAO.save(cours);
            response.sendRedirect(request.getContextPath() + "/GetMatiere");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Matiere> coursList = matiereDAO.findAll();
        List<Utilisateur> utilisateursList = utilisateurDAO.findAllByRole("enseignant");
        List<Salle> salles = salleDAO.findAll();

        request.setAttribute("salle", salles);
        request.setAttribute("enseignant", utilisateursList);
        request.setAttribute("coursList", coursList);
        request.getRequestDispatcher("/Admin/createCourse.jsp").forward(request, response);
    }
}
