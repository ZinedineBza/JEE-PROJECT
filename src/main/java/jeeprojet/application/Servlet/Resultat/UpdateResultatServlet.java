package jeeprojet.application.Servlet.Resultat;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.ResultatDAO;
import jeeprojet.application.Modele.Resultat;
import jeeprojet.application.Modele.ResultatId;
import jeeprojet.application.Util.GMailer;

@WebServlet("/updateResultat")
public class UpdateResultatServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Récupérer les paramètres du formulaire
        String etudiantId = request.getParameter("etudiant");
        String coursId = request.getParameter("cours");
        String date = request.getParameter("date");
        float note = Float.parseFloat(request.getParameter("note"));
        String commentaire = request.getParameter("commentaire");

        System.out.println("Paramètres reçus - Etudiant: " + etudiantId + ", Cours: " + coursId + ", Date: " + date + ", Note: " + note + ", Commentaire: " + commentaire);

        // Création de l'ID composite
        ResultatId id = new ResultatId();
        id.setCours(coursId);
        id.setDate(date);
        id.setEtudiant(etudiantId);

        // Initialisation de la DAO pour accéder à la base de données
        ResultatDAO resultatDAO = new ResultatDAO();

        // Récupérer l'objet Resultat à partir de l'ID composite
        Resultat resultat = resultatDAO.get(id);
        if (resultat != null) {
            System.out.println("Résultat trouvé: " + resultat);

            // Mise à jour des valeurs
            resultat.setNote(note);
            resultat.setCommentaire(commentaire);

            // Sauvegarder les modifications
            resultatDAO.update(resultat);
            System.out.println("Résultat mis à jour avec la nouvelle note: " + note + " et commentaire: " + commentaire);
        } else {
            System.out.println("Aucun résultat trouvé pour l'ID donné.");
        }

        //envoi du mail
        GMailer gMailer;
        try {
            gMailer = new GMailer();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        try {
            gMailer.sendMail("[CY ENT]Note modifiée","Bonjour, \n\nVotre note en "+coursId+ " a été modifiée. Vous avez obtenu: "+note+"\n\nCordialement,\nVotre ENT",etudiantId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        // Redirection après mise à jour
        response.sendRedirect("listResultats");
        System.out.println("Redirection vers la liste des résultats.");

    }
}
