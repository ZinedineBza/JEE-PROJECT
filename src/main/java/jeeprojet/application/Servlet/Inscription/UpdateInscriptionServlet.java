package jeeprojet.application.Servlet.Inscription;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jeeprojet.application.Modele.DAO.InscriptionDAO;
import jeeprojet.application.Modele.Inscription;
import jeeprojet.application.Modele.InscriptionId;
import jeeprojet.application.Modele.Matiere;
import jeeprojet.application.Modele.Utilisateur;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

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
        Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");

        InscriptionId id = new InscriptionId();
        id.setDateInscription(date);
        id.setEtudiant(etudiantEmail);



        if (Objects.equals(utilisateur.getRole(), "admin")) {
            Inscription inscription = inscriptionDAO.findById(id);
            Utilisateur etudiant = inscriptionDAO.findUtilisateurByEmail(etudiantEmail);
            Matiere cours = inscriptionDAO.findCoursById(coursId);
            id.setMatiere(cours.getNom());

            if (inscription != null && etudiant != null && cours != null) {
                inscription.setEtudiant(etudiant);

                inscriptionDAO.update(inscription);
                response.sendRedirect("ListInscriptionServlet");
            } else {
                request.setAttribute("error", "Impossible de mettre à jour l'inscription.");
                request.getRequestDispatcher("editInscription.jsp").forward(request, response);
            }
        }
    }

}

