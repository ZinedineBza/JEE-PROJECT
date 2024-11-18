package jeeprojet.application.Servlet.Inscription;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jeeprojet.application.Modele.DAO.InscriptionDAO;
import jeeprojet.application.Modele.Inscription;
import jeeprojet.application.Modele.Cour; // Vérifiez le nom exact de votre classe Cour
import jeeprojet.application.Modele.Matiere;
import jeeprojet.application.Modele.Utilisateur;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import jeeprojet.application.Modele.InscriptionId;

@WebServlet("/UpdateInscriptionServlet")
public class UpdateInscriptionServlet extends HttpServlet {
    private InscriptionDAO inscriptionDAO;

    @Override
    public void init() {
        inscriptionDAO = new InscriptionDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String date = request.getParameter("date");
        String etudiantEmail = request.getParameter("etudiantEmail");
        String coursId = request.getParameter("coursId");

        InscriptionId id = new InscriptionId();
        id.setDateInscription(date);
        id.setEtudiant(etudiantEmail);


        Inscription inscription = inscriptionDAO.findById(id);
        Utilisateur etudiant = inscriptionDAO.findUtilisateurByEmail(etudiantEmail);
        Matiere cours = inscriptionDAO.findCoursById(coursId);

        if (inscription != null && etudiant != null && cours != null) {
            inscription.setEtudiant(etudiant);
            inscription.setCours(cours);
            inscriptionDAO.update(inscription);
            response.sendRedirect("ListInscriptionServlet");
        } else {
            request.setAttribute("error", "Impossible de mettre à jour l'inscription.");
            request.getRequestDispatcher("editInscription.jsp").forward(request, response);
        }
    }
}

