package jeeprojet.application.Servlet.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.UtilisateurDAO;
import jeeprojet.application.Modele.Utilisateur;
import jeeprojet.application.Util.GMailer;
import jeeprojet.application.Util.GenerateUser;

import java.io.IOException;

@WebServlet("/forgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        UtilisateurDAO utilisateurDAO = new UtilisateurDAO();
        boolean emailExists = utilisateurDAO.emailExists(email);

        if (emailExists) {
            Utilisateur utilisateur = utilisateurDAO.findById(email);
            GenerateUser generateUser = new GenerateUser();
            String motDePasse = null;
            try {
                motDePasse = generateUser.generateSecurePassword(email);
                utilisateur.setMotDePasse(motDePasse);
                utilisateurDAO.update(utilisateur);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }


            response.sendRedirect("index.jsp?message=nouveau_mot_de_passe_par_mail");
        } else {
            // Rediriger avec un message d'erreur si l'e-mail n'existe pas
            response.sendRedirect("index.jsp?error=email_inconnu");
        }
    }
}
