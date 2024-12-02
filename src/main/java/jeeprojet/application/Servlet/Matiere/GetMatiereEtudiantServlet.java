package jeeprojet.application.Servlet.Matiere;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.InscriptionDAO;
import jeeprojet.application.Modele.Inscription;
import jeeprojet.application.Modele.Matiere;

import java.io.IOException;
import java.util.List;

@WebServlet("/getMatieresEtudiant")
public class GetMatiereEtudiantServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer l'email de l'étudiant
        String etudiantEmail = request.getParameter("etudiantEmail");
        System.out.println(etudiantEmail);

        // Récupérer les matières auxquelles l'étudiant est inscrit depuis l'InscriptionDAO
        InscriptionDAO inscriptionDAO = new InscriptionDAO();
        List<Inscription> matieres = inscriptionDAO.findCoursUtilisateur(etudiantEmail);
        System.out.println(matieres);
        StringBuilder rows = new StringBuilder();
        for (Inscription matiere : matieres) {
            rows.append("<option value=\"").append(matiere.getId().getMatiere()).append("\">")
                    .append(matiere.getId().getMatiere())
                    .append("</option>");
        }
        response.getWriter().write(rows.toString());
    }
}

