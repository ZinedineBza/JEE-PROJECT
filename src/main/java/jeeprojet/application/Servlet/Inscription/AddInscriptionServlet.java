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
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet("/AddInscriptionServlet")
public class AddInscriptionServlet extends HttpServlet {
    private InscriptionDAO inscriptionDAO;

    @Override
    public void init() {
        inscriptionDAO = new InscriptionDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("addInscription.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String etudiantEmail = request.getParameter("etudiantEmail");
        String coursId = request.getParameter("coursId");
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String dateInscription = currentDate.format(formatter);
        InscriptionId id = new InscriptionId();
        id.setEtudiant(etudiantEmail);
        id.setDateInscription(dateInscription);
        System.out.println("Etudiant Email: " + etudiantEmail);
        System.out.println("Cours ID: " + coursId);
        System.out.println("Date Inscription: " + dateInscription);
        System.out.println("Inscription ID: " + id.getEtudiant() + ", " + id.getDateInscription());


        try {
            Utilisateur etudiant = inscriptionDAO.findUtilisateurByEmail(etudiantEmail);
            System.out.println("FINDUTILISATEUR: " +etudiant);
            Matiere cours = inscriptionDAO.findCoursById(coursId);
            System.out.println("FINDCours: " +cours);

            if (etudiant == null || cours == null) {
                request.setAttribute("error", "Utilisateur ou cours introuvable.");
                request.getRequestDispatcher("addInscription.jsp").forward(request, response);
                return;
            }

            Inscription inscription = new Inscription();
            inscription.setEtudiant(etudiant);
            inscription.setCours(cours);
            inscription.setId(id);

            inscriptionDAO.save(inscription);
            response.sendRedirect("ListInscriptionServlet");

        } catch (Exception e) {
            e.printStackTrace(); // Ajoutez un journal pour des erreurs détaillées
            request.setAttribute("error", "Une erreur est survenue lors de l'ajout de l'inscription.");
            request.getRequestDispatcher("addInscription.jsp").forward(request, response);
        }
    }
}
