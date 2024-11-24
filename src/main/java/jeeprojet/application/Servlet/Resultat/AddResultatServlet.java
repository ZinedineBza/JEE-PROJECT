package jeeprojet.application.Servlet.Resultat;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.MatiereDAO;
import jeeprojet.application.Modele.DAO.ResultatDAO;
import jeeprojet.application.Modele.DAO.UtilisateurDAO;
import jeeprojet.application.Modele.Matiere;
import jeeprojet.application.Modele.Resultat;
import jeeprojet.application.Modele.ResultatId;
import jeeprojet.application.Modele.Utilisateur;

@WebServlet("/addResultat")
public class AddResultatServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération des paramètres depuis la requête
        String etudiantId = request.getParameter("etudiant");
        String coursId = request.getParameter("cours");
        String noteStr = request.getParameter("note");
        String commentaire = request.getParameter("commentaire");
        String date = request.getParameter("date");

        // Affichage des données reçues pour débogage
        System.out.println("etudiantId: " + etudiantId);
        System.out.println("coursId: " + coursId);
        System.out.println("noteStr: " + noteStr);
        System.out.println("commentaire: " + commentaire);
        System.out.println("date: " + date);

        // Validation des paramètres
        if (etudiantId == null || coursId == null || noteStr == null) {
            response.getWriter().write("Erreur : Les paramètres obligatoires sont manquants.");
            return;
        }


            // Convertir la note en Float
            Float note = Float.parseFloat(noteStr);
            System.out.println("note: " + note);

            // Récupérer l'étudiant et le cours à partir de leurs identifiants
            UtilisateurDAO utilisateurDAO = new UtilisateurDAO();
            MatiereDAO matiereDAO = new MatiereDAO();

            Utilisateur etudiant = utilisateurDAO.findById(etudiantId); // Trouver l'étudiant
            Matiere cours = matiereDAO.findById(coursId); // Trouver le cours

            // Affichage des objets récupérés pour débogage
            System.out.println("etudiant trouvé: " + (etudiant != null ? etudiant.getEmail() : "non trouvé"));
            System.out.println("cours trouvé: " + (cours != null ? cours.getNom() : "non trouvé"));

            // Vérifier si l'étudiant et le cours existent
            if (etudiant == null || cours == null) {
                response.getWriter().write("Erreur : L'étudiant ou le cours n'existe pas.");
                return;
            }

            // Créer un identifiant composite pour le résultat
            ResultatId id = new ResultatId();
            id.setEtudiant(etudiant.getEmail()); // Assignation de l'étudiant
            id.setCours(cours.getNom()); // Assignation du cours
            id.setDate(date);

            // Affichage de l'identifiant composite pour débogage
            System.out.println("Identifiant composite créé: Etudiant ID = " + etudiant.getEmail() + ", Cours ID = " + cours.getNom());

            // Créer l'objet Resultat
            Resultat resultat = new Resultat();
            resultat.setId(id); // Assigner l'identifiant composite
            resultat.setEtudiant(etudiant); // Assigner l'étudiant
            resultat.setCours(cours); // Assigner le cours
            resultat.setNote(note); // Assigner la note
        resultat.setCommentaire(commentaire); // Assigner le commentaire

            // Affichage de l'objet Resultat pour débogage
        System.out.println("Objet Resultat créé: " + resultat);
            // Sauvegarder l'objet Resultat dans la base de données
        ResultatDAO resultatDAO = new ResultatDAO();
        resultatDAO.save(resultat);
        response.sendRedirect("listResultats");


    }
}
