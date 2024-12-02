package jeeprojet.application.Servlet.Cours;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.*;
import jeeprojet.application.Modele.DAO.CoursDAO;
import jeeprojet.application.Modele.DAO.InscriptionDAO;
import jeeprojet.application.Modele.DAO.MatiereDAO;
import jeeprojet.application.Modele.DAO.UtilisateurDAO;
import jeeprojet.application.Util.GMailer;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@WebServlet("/updateCourse")
public class UpdateCoursesServlet extends HttpServlet {

    private CoursDAO courDAO;
    private MatiereDAO matiereDAO;
    private UtilisateurDAO utilisateurDAO;

    private InscriptionDAO inscriptionDAO;



    public void init() {
        courDAO = new CoursDAO();
        matiereDAO = new MatiereDAO();
        utilisateurDAO = new UtilisateurDAO();
        inscriptionDAO = new InscriptionDAO();

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String enseignantEmail = request.getParameter("enseignant");
        String nomMatiere = request.getParameter("matiere");
        String date = request.getParameter("date");
        String horaireancienne = request.getParameter("horaireancienne");
        String dateancienne = request.getParameter("dateancienne");
        String horaire = request.getParameter("horaire");
        String salle = request.getParameter("salle");



        Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");
        CourId courId = new CourId();
        courId.setEnseignant(enseignantEmail);
        courId.setDate(date);
        courId.setHoraire(horaire);

        CourId anciencourId = new CourId();
        anciencourId.setEnseignant(enseignantEmail);
        anciencourId.setDate(dateancienne);
        anciencourId.setHoraire(horaireancienne);

        if (!Objects.equals(utilisateur.getRole(), "admin")) {
        response.sendRedirect("index.jsp");}

        Cour cours = courDAO.findById(anciencourId);
        Matiere matiere = matiereDAO.findById(nomMatiere);
        Utilisateur user = utilisateurDAO.findById(enseignantEmail);

        // Initialisation des erreurs
        List< String> errors = new ArrayList<>();

        // Vérification de la date
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate datelo = LocalDate.parse(date, formatter);
        LocalDate dateloa = LocalDate.parse(dateancienne,formatter);
        LocalDate currentDate = LocalDate.now();

        long daysBetween = ChronoUnit.DAYS.between(currentDate, datelo);
        long daysBetween1 = ChronoUnit.DAYS.between(currentDate, dateloa);
        if (daysBetween < 2 || daysBetween1 < 2) {
            errors.add( "La modification d'un cours doit être effectuée au moins 2 jours à l'avance.");
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
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.setAttribute("cours", cours);
            request.getRequestDispatcher("Admin/updateCourse.jsp?enseignantEmail=" + enseignantEmail +
                    "&nomMatiere=" + matiere +
                    "&date=" + date +
                    "&horaire=" + horaire +
                    "&salle=" + salle).forward(request, response);

        }else {


            String conflictMessage = courDAO.hasConflict(enseignantEmail, salle, date, horaire);
            if (conflictMessage != null) {
                request.setAttribute("errors", conflictMessage);
                request.setAttribute("cours", cours);
                request.getRequestDispatcher("Admin/updateCourse.jsp?enseignantEmail=" + enseignantEmail +
                        "&nomMatiere=" + matiere +
                        "&date=" + date +
                        "&horaire=" + horaire +
                        "&salle=" + salle).forward(request, response);
            }else {

                //envoi du mail
                GMailer gMailer;
                try {
                    gMailer = new GMailer();
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                try {
                    gMailer.sendMail("[CY ENT] Un cours a été modifié", "Bonjour,\n\n  Votre cours de " + nomMatiere + " du " + dateancienne + " à " + horaireancienne + " en " + salle + " a été modifié :\n" + "\n-Date: " + date + "\n-Horaire: " + horaire + "\n-Salle: " + salle + "\n\nCordialement,\nVotre ENT", enseignantEmail);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }

                List<Inscription> inscriptions = inscriptionDAO.findByCours(nomMatiere, dateancienne, horaireancienne);

                if (inscriptions != null && !inscriptions.isEmpty()) {
                    for (Inscription inscription : inscriptions) {
                        try {
                            gMailer.sendMail("[CY ENT] Un cours a été modifié", "Bonjour,\n\n  Votre cours de " + nomMatiere + " du " + dateancienne + " à " + horaireancienne + " en " + salle + " a été modifié :\n" + "\n-Date: " + date + "\n-Horaire: " + horaire + "\n-Salle: " + salle + "\n\nCordialement,\nVotre ENT", inscription.getEtudiant().getEmail());
                        } catch (Exception e) {
                            throw new RuntimeException(e);
                        }
                        try {
                            gMailer.sendMail("[CY ENT] Un cours a été modifié", "Bonjour,\n\n  Votre cours de " + nomMatiere + " du " + dateancienne + " à " + horaireancienne + " en " + salle + " a été modifié :\n" + "\n-Date: " + date + "\n-Horaire: " + horaire + "\n-Salle: " + salle + "\n\nCordialement,\nVotre ENT", enseignantEmail);
                        } catch (Exception e) {
                            throw new RuntimeException(e);
                        }
                    }

                } else {
                    System.out.println("Aucun étudiant inscrit à ce cours.");
                }
                courDAO.delete(cours);
                Cour newCours = new Cour();
                newCours.setId(courId);
                newCours.setNom(matiere); // Mettre à jour le nom de la matière
                newCours.setSalle(salle);    // Mettre à jour la salle
                newCours.setEnseignant(user); // Ajouter ou mettre à jour l'enseignant
                courDAO.save(newCours);
                response.sendRedirect(request.getContextPath() + "/GetMatiere");
            }
        }

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
        request.getRequestDispatcher("Admin/updateCourse.jsp").forward(request, response);
    }
}