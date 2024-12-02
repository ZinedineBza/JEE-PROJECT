package jeeprojet.application.Servlet.Enseignant;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/addResultatEnseignant")
public class AddResultatServlet extends HttpServlet {
    private UtilisateurDAO utilisateurDAO;
    private MatiereDAO matiereDAO;
    private ResultatDAO resultatDAO;

    @Override
    public void init() {
        utilisateurDAO = new UtilisateurDAO();
        matiereDAO = new MatiereDAO();
        resultatDAO = new ResultatDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Vérifier si l'utilisateur est connecté
        Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }
    
        List<Matiere> matieres = null;
        List<Utilisateur> etudiants = null;
    
        // Récupération des données en fonction du rôle de l'utilisateur
        if (user.getRole().equalsIgnoreCase("enseignant")) {
            String enseignantEmail = user.getEmail();
    
            // Récupérer les cours enseignés par l'enseignant
            matieres = matiereDAO.findMatiereByEnseignant(enseignantEmail);
    
            // Récupérer les étudiants inscrits aux cours de l'enseignant
            etudiants = utilisateurDAO.findEtudiantsInscritsAuxMatieres(enseignantEmail);
    
            System.out.println("Enseignant connecté : " + enseignantEmail);
        } else if (user.getRole().equalsIgnoreCase("admin")) {
            etudiants = utilisateurDAO.findByRole("etudiant");
        } else {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }
        
        // Ajouter les données à la requête pour la JSP
        request.setAttribute("etudiants", etudiants);
        // Rediriger vers la JSP
        request.getRequestDispatcher("/Enseignant/addResultat.jsp").forward(request, response);
    }
        

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération des paramètres depuis la requête
        String etudiantEmail = request.getParameter("etudiant");
        String coursNom = request.getParameter("cours");
        String noteStr = request.getParameter("note");
        String commentaire = request.getParameter("commentaire");
        String dateStr = request.getParameter("date");

        // Affichage des données reçues pour débogage
        System.out.println("etudiantEmail: " + etudiantEmail);
        System.out.println("coursNom: " + coursNom);
        System.out.println("noteStr: " + noteStr);
        System.out.println("commentaire: " + commentaire);
        System.out.println("dateStr: " + dateStr);

        // Validation des paramètres
        if (etudiantEmail == null || coursNom == null || noteStr == null) {
            response.getWriter().write("Erreur : Les paramètres obligatoires sont manquants.");
            return;
        }

        try {
            // Convertir la note en Float
            Float note = Float.parseFloat(noteStr);
            System.out.println("note: " + note);

            // Récupérer l'étudiant et la matière à partir de leurs identifiants
            Utilisateur etudiant = utilisateurDAO.findById(etudiantEmail);
            Matiere cours = matiereDAO.findByName(coursNom);

            // Affichage des objets récupérés pour débogage
            System.out.println("etudiant trouvé: " + (etudiant != null ? etudiant.getEmail() : "non trouvé"));
            System.out.println("cours trouvé: " + (cours != null ? cours.getNom() : "non trouvé"));

            // Vérifier si l'étudiant et le cours existent
            if (etudiant == null || cours == null) {
                response.getWriter().write("Erreur : L'étudiant ou le cours n'existe pas.");
                return;
            }

            // Créer un identifiant composite pour le résultat
            ResultatId resultatId = new ResultatId();
            resultatId.setEtudiant(etudiant.getEmail());
            resultatId.setCours(cours.getNom());
            resultatId.setDate(dateStr);

            // Affichage de l'identifiant composite pour débogage
            System.out.println("Identifiant composite créé: Etudiant ID = " + etudiant.getEmail() + ", Cours ID = " + cours.getNom());

            // Créer l'objet Resultat
            Resultat resultat = new Resultat();
            resultat.setId(resultatId);
            resultat.setEtudiant(etudiant);
            resultat.setCours(cours);
            resultat.setNote(note);
            resultat.setCommentaire(commentaire);

            // Affichage de l'objet Resultat pour débogage
            System.out.println("Objet Resultat créé: " + resultat);

            // Sauvegarder l'objet Resultat dans la base de données
            resultatDAO.save(resultat);

            // Rediriger vers la liste des résultats
            response.sendRedirect(request.getContextPath() + "/listResultatsEnseignant");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Erreur lors de l'ajout du résultat.");
        }
    }
}
