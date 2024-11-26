package jeeprojet.application.Servlet.Inscription;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jeeprojet.application.Modele.*;
import jeeprojet.application.Modele.DAO.InscriptionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.MatiereDAO;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/AddInscriptionServlet")
public class AddInscriptionServlet extends HttpServlet {
    private InscriptionDAO inscriptionDAO;
    private MatiereDAO matiereDAO;



    @Override
    public void init() {
        inscriptionDAO = new InscriptionDAO();
        matiereDAO = new MatiereDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String etudiantEmail = request.getParameter("etudiantEmail");
        String matiereId = request.getParameter("coursId");
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String dateInscription = currentDate.format(formatter);
        Map<String, String> errors = new HashMap<>();

        // Récupérer l'étudiant et la matière
        Utilisateur etudiant = inscriptionDAO.findUtilisateurByEmail(etudiantEmail);
        Matiere cours = inscriptionDAO.findCoursById(matiereId);

        if (etudiant == null || cours == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Étudiant ou matière introuvable");
            return;
        }

        // Vérifier si l'élève est déjà inscrit à cette matière
        if (inscriptionDAO.isAlreadyEnrolled(etudiantEmail, cours.getNom())) {
            errors.put("error", "L'élève est déjà inscrit à cette matière.");
            request.setAttribute("error", "L'élève est déjà inscrit à cette matière.");
            request.setAttribute("coursList", matiereDAO.findAll());
            //response.sendRedirect("ListInscriptionServlet");
            request.getRequestDispatcher("ListInscriptionServlet").forward(request, response);
            return;
        }

        // Créer l'ID d'inscription
        InscriptionId id = new InscriptionId();
        id.setEtudiant(etudiantEmail);
        id.setDateInscription(dateInscription);
        id.setMatiere(cours.getNom());

        // Créer une nouvelle inscription
        Inscription inscription = new Inscription();
        inscription.setEtudiant(etudiant);
        inscription.setId(id);
        inscription.setMatiere(cours);

        // Sauvegarder l'inscription
        inscriptionDAO.save(inscription);

        // Rediriger vers la liste des inscriptions
        response.sendRedirect("ListInscriptionServlet");
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer la liste des matières depuis la base de données
        List<Matiere> coursList = matiereDAO.findAll();
        request.setAttribute("coursList", coursList);
        // Rediriger vers la page JSP
        request.getRequestDispatcher("/Etudiant/addInscription.jsp").forward(request, response);
    }

}