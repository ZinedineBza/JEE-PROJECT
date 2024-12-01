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
        System.out.println("horaire ancienne "+horaireancienne);
        System.out.println("date ancienne "+dateancienne);
        System.out.println("enseignantEmail: " + enseignantEmail);
        System.out.println("date: " + date);
        System.out.println("horaire: " + horaire);
        System.out.println("salle: " + salle);
        System.out.println("nomMatiere: " + nomMatiere);


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
            System.out.println( "Cours ;"+ cours+"Matiere " + matiere +"User :"+ user);

            //envoi du mail
            GMailer gMailer;
            try {
                gMailer = new GMailer();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            try {
                gMailer.sendMail("[CY ENT] Un cours a été modifié","Bonjour,\n\n  Votre cours de "+nomMatiere+" du "+dateancienne+" à "+horaireancienne+" en "+salle+" a été modifié :\n"+"\n-Date: "+ date+"\n-Horaire: "+horaire+"\n-Salle: "+salle+"\n\nCordialement,\nVotre ENT",enseignantEmail);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

            List<Inscription> inscriptions = inscriptionDAO.findByCours(nomMatiere, dateancienne, horaireancienne);
            if (inscriptions != null && !inscriptions.isEmpty()) {
                System.out.println("Étudiants inscrits au cours :");

                for (Inscription inscription : inscriptions) {
                    System.out.println("Email étudiant : " + inscription.getEtudiant().getEmail());
                }

                if (inscriptions != null && !inscriptions.isEmpty()) {
                    for (Inscription inscription : inscriptions) {
                        try {
                            gMailer.sendMail("[CY ENT] Un cours a été modifié","Bonjour,\n\n  Votre cours de "+nomMatiere+" du "+dateancienne+" à "+horaireancienne+" en "+salle+" a été modifié :\n"+"\n-Date: "+ date+"\n-Horaire: "+horaire+"\n-Salle: "+salle+"\n\nCordialement,\nVotre ENT",inscription.getEtudiant().getEmail());
                        } catch (Exception e) {
                            throw new RuntimeException(e);
                        }
                        try {
                            gMailer.sendMail("[CY ENT] Un cours a été modifié","Bonjour,\n\n  Votre cours de "+nomMatiere+" du "+dateancienne+" à "+horaireancienne+" en "+salle+" a été modifié :\n"+"\n-Date: "+ date+"\n-Horaire: "+horaire+"\n-Salle: "+salle+"\n\nCordialement,\nVotre ENT",enseignantEmail);
                        } catch (Exception e) {
                            throw new RuntimeException(e);
                        }
                    }
                }

            } else {
                System.out.println("Aucun étudiant inscrit à ce cours.");
            }
            String conflictMessage = courDAO.hasConflict(enseignantEmail, salle, date, horaire);
            System.out.println(conflictMessage);
            if (conflictMessage != null) {
                request.setAttribute("errors", conflictMessage);
                request.setAttribute("cours", cours);
                request.getRequestDispatcher("Admin/updateCourse.jsp?enseignantEmail=" + enseignantEmail +
                        "&nomMatiere=" + matiere +
                        "&date=" + date +
                        "&horaire=" + horaire +
                        "&salle="+salle).forward(request, response);
            }
                courDAO.delete(cours);
                Cour newCours = new Cour();
                newCours.setId(courId);
                newCours.setNom(matiere); // Mettre à jour le nom de la matière
                newCours.setSalle(salle);    // Mettre à jour la salle
                newCours.setEnseignant(user); // Ajouter ou mettre à jour l'enseignant
                courDAO.save(newCours);
                response.sendRedirect(request.getContextPath()+ "/GetMatiere");

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