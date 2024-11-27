package jeeprojet.application.Servlet.Cours;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.CourId;
import jeeprojet.application.Modele.DAO.CoursDAO;
import jeeprojet.application.Modele.Cour;
import jeeprojet.application.Modele.DAO.MatiereDAO;
import jeeprojet.application.Modele.DAO.UtilisateurDAO;
import jeeprojet.application.Modele.Matiere;
import jeeprojet.application.Modele.Utilisateur;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

@WebServlet("/updateCourse")
public class UpdateCoursesServlet extends HttpServlet {

    private CoursDAO courDAO;
    private MatiereDAO matiereDAO;
    private UtilisateurDAO utilisateurDAO;


    public void init() {
        courDAO = new CoursDAO();
        matiereDAO = new MatiereDAO();
        utilisateurDAO = new UtilisateurDAO();
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

        if (Objects.equals(utilisateur.getRole(), "admin")) {
            // Récupérer l'ancien cours avec l'ID
            Cour cours = courDAO.findById(anciencourId);
            Matiere matiere = matiereDAO.findById(nomMatiere);
            Utilisateur user = utilisateurDAO.findById(enseignantEmail);
            System.out.println( "Cours ;"+ cours+"Matiere " + matiere +"User :"+ user);




            courDAO.delete(cours);


            // Créer un nouveau cours avec les nouvelles informations
            Cour newCours = new Cour();
            newCours.setId(courId);
            newCours.setNom(matiere); // Mettre à jour le nom de la matière
            newCours.setSalle(salle);    // Mettre à jour la salle
            newCours.setEnseignant(user); // Ajouter ou mettre à jour l'enseignant

            // Enregistrer le nouveau cours
            courDAO.save(newCours);
        }

        response.sendRedirect( request.getContextPath() +"/GetMatiere");
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

