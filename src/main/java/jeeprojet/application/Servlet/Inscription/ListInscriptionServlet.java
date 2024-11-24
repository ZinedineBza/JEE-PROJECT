package jeeprojet.application.Servlet.Inscription;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.InscriptionDAO;
import jeeprojet.application.Modele.DAO.MatiereDAO;
import jeeprojet.application.Modele.Inscription;
import jeeprojet.application.Modele.Matiere;
import jeeprojet.application.Modele.Utilisateur;

@WebServlet("/ListInscriptionServlet")
public class ListInscriptionServlet extends HttpServlet {
    private InscriptionDAO inscriptionDAO;

    @Override
    public void init() {
        inscriptionDAO = new InscriptionDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération de l'utilisateur connecté depuis la session
        Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");

        if (utilisateur == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        List<Inscription> inscriptions;

        // Récupérer les inscriptions selon le rôle de l'utilisateur
        if (Objects.equals(utilisateur.getRole(), "admin")) {
            inscriptions = inscriptionDAO.findAll();
            System.out.println("AAAAAA" + inscriptions);
            request.setAttribute("inscriptions", inscriptions);
            request.getRequestDispatcher("/Admin/listInscription.jsp").forward(request, response);
        } else if (Objects.equals(utilisateur.getRole(), "etudiant")) {
            inscriptions = inscriptionDAO.findCoursUtilisateur(utilisateur.getEmail());
            MatiereDAO matiereDAO = new MatiereDAO();
            List<Matiere> matieres = matiereDAO.findAll();
            request.setAttribute("matieres", matieres);
            request.setAttribute("inscriptions", inscriptions);
            request.getRequestDispatcher("/Admin/listInscription.jsp").forward(request, response);
        }  else if(Objects.equals(utilisateur.getRole(), "enseignant")) {
            String enseignantEmail = ((Utilisateur) request.getSession().getAttribute("user")).getEmail();
            inscriptions = inscriptionDAO.findByEnseignant(enseignantEmail);
            request.setAttribute("inscriptions", inscriptions);
            request.getRequestDispatcher("/Enseignant/listInscriptions.jsp").forward(request, response);
        }else {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Accès non autorisé");
            return;
        }

    }
}
