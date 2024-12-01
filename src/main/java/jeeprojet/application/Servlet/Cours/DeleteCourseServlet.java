package jeeprojet.application.Servlet.Cours;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.CoursDAO;
import jeeprojet.application.Modele.Cour;
import jeeprojet.application.Modele.CourId;
import jeeprojet.application.Modele.DAO.InscriptionDAO;
import jeeprojet.application.Modele.Inscription;
import jeeprojet.application.Modele.Utilisateur;
import jeeprojet.application.Util.GMailer;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Objects;

@WebServlet("/deleteCourse")
public class DeleteCourseServlet extends HttpServlet {

    private CoursDAO coursDAO;
    private InscriptionDAO inscriptionDAO; // Ajout du DAO pour les inscriptions

    public void init() {
        coursDAO = new CoursDAO();
        inscriptionDAO = new InscriptionDAO(); // Initialisation du DAO pour les inscriptions
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
                // *** Récupération des étudiants inscrits avant suppression ***
                List<Inscription> inscriptions = inscriptionDAO.findByCours(cours.getNom().getNom(), date, horaire);
                if (inscriptions != null && !inscriptions.isEmpty()) {
                    System.out.println("Étudiants inscrits au cours à supprimer :");
                    for (Inscription inscription : inscriptions) {
                        System.out.println("Email étudiant : " + inscription.getEtudiant().getEmail());
                        // Vous pouvez ajouter ici des actions comme notifier les étudiants
                    }
                } else {
                    System.out.println("Aucun étudiant inscrit à ce cours.");
                }
                // *** Fin de la récupération des inscriptions ***
                //envoi du mail
                GMailer gMailer;
                try {
                    gMailer = new GMailer();
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }

                if (inscriptions != null && !inscriptions.isEmpty()) {
                    for (Inscription inscription : inscriptions) {
                        try {
                            gMailer.sendMail("[CY ENT] Un cours a été annulé","Bonjour,\n\nVotre cours du "+date+" à "+horaire+" a été annulé. Nous vous invitons à regarder votre emploi du temps sur l'ENT.\n\nCordialement,\nVotre ENT",inscription.getEtudiant().getEmail());
                        } catch (Exception e) {
                            throw new RuntimeException(e);
                        }
                    }
                    try {
                        gMailer.sendMail("[CY ENT] Un cours a été annulé","Bonjour,\n\nVotre cours du "+date+" à "+horaire+" a été annulé. Nous vous invitons à regarder votre emploi du temps sur l'ENT.\n\nCordialement,\nVotre ENT",enseignantEmail);
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
                }

                // Si le cours est trouvé, on le supprime
                coursDAO.delete(cours);
            }

            // Redirection vers la liste des cours après suppression
            response.sendRedirect(request.getContextPath() +"/GetMatiere");
        }
    }
}
