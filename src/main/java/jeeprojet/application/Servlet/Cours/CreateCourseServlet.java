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
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.temporal.ChronoUnit;
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
        List< String> errors = new ArrayList<>();

        // Vérification de la date
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate datelo = LocalDate.parse(date, formatter);
        LocalDate currentDate = LocalDate.now();

        long daysBetween = ChronoUnit.DAYS.between(currentDate, datelo);
        if (daysBetween < 2) {
            errors.add( "L'ajout d'un cours doit être effectuée au moins 2 jours à l'avance.");
        }
        // Vérification que la date ne soit pas un samedi ou un dimanche
        int dayOfWeek = datelo.getDayOfWeek().getValue(); // 1 pour lundi, 7 pour dimanche
        if (dayOfWeek == 6 || dayOfWeek == 7) {
            errors.add("La date ne peut pas être un samedi ou un dimanche.");
        }
        try {
            // Parser l'horaire en tant que LocalTime
            LocalTime time = LocalTime.parse(horaire);
            // Vérifier que l'horaire est entre 08:00 et 18:00
            if (time.isBefore(LocalTime.of(8, 0)) || time.isAfter(LocalTime.of(18, 0))) {
                errors.add( "L'horaire doit être entre 08:00 et 18:00.");
            }
        } catch (DateTimeParseException e) {
            errors.add( "L'horaire est invalide. Veuillez entrer un horaire au format HH:mm.");
        }

        // Vérification de l'enseignant
        Utilisateur enseignant = utilisateurDAO.findById(enseignantMail);
        Utilisateur isEnseignant = utilisateurDAO.findByIdEnseignant(enseignantMail);

        if (enseignant == null) {
            errors.add( "L'email renseigné n'est pas attribué. Veuillez réessayer.");
        }
        if (isEnseignant == null) {
            errors.add( "L'email renseigné n'appartient pas à un enseignant. Veuillez réessayer.");
        }


        // Si des erreurs existent, rediriger vers la page avec les erreurs
        if (!errors.isEmpty()) {
            List<Matiere> coursList = matiereDAO.findAll();
            List<Utilisateur> utilisateursList = utilisateurDAO.findAllByRole("enseignant");
            List<Salle> salles = salleDAO.findAll();

            request.setAttribute("selectedSalle", salles);
            request.setAttribute("enseignant", utilisateursList);
            request.setAttribute("coursList", coursList);
            request.setAttribute("errors", errors);

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
            request.setAttribute("selectedSalle", salles);
            request.setAttribute("enseignant", utilisateursList);
            request.setAttribute("coursList", coursList);
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

        request.setAttribute("selectedSalle", salles);
        request.setAttribute("enseignant", utilisateursList);
        request.setAttribute("coursList", coursList);
        request.getRequestDispatcher("/Admin/createCourse.jsp").forward(request, response);
    }
}
