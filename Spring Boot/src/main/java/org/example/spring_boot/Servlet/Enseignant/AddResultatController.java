package org.example.spring_boot.Servlet.Enseignant;
import jakarta.servlet.http.HttpSession;
import org.example.spring_boot.Modele.DAO.MatiereRepository;
import org.example.spring_boot.Modele.DAO.ResultatRepository;
import org.example.spring_boot.Modele.DAO.UtilisateurRepository;
import org.example.spring_boot.Modele.Matiere;
import org.example.spring_boot.Modele.Resultat;
import org.example.spring_boot.Modele.ResultatId;
import org.example.spring_boot.Modele.Utilisateur;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
public class AddResultatController {

    private final UtilisateurRepository utilisateurDAO;
    private final MatiereRepository matiereDAO;
    private final ResultatRepository resultatDAO;

    public AddResultatController(UtilisateurRepository utilisateurDAO, MatiereRepository matiereDAO, ResultatRepository resultatDAO) {
        this.utilisateurDAO = utilisateurDAO;
        this.matiereDAO = matiereDAO;
        this.resultatDAO = resultatDAO;
    }

    // Gestion des requêtes GET pour afficher le formulaire d'ajout de résultat
    @GetMapping("/enseignant/addResultat")
    public String showAddResultatPage(HttpSession session, Model model) {
        Utilisateur user = (Utilisateur) session.getAttribute("user");

        // Vérification de l'utilisateur connecté
        if (user == null) {
            return "redirect:/";
        }

        List<Matiere> matieres;
        List<Utilisateur> etudiants;

        if ("enseignant".equalsIgnoreCase(user.getRole())) {
            String enseignantEmail = user.getEmail();
            matieres = matiereDAO.findMatiereByEnseignant(enseignantEmail);
            etudiants = utilisateurDAO.findEtudiantsInscritsAuxMatieres(enseignantEmail);
        } else if ("admin".equalsIgnoreCase(user.getRole())) {
            matieres = matiereDAO.findAll();
            etudiants = utilisateurDAO.findByRole("etudiant");
        } else {
            return "redirect:/";
        }

        model.addAttribute("etudiants", etudiants);
        model.addAttribute("matieres", matieres);

        return "Enseignant/addResultat"; // Correspond à /WEB-INF/jsp/Enseignant/addResultat.jsp
    }

    // Gestion des requêtes POST pour ajouter un résultat
    @PostMapping("/enseignant/addResultat")
    public String addResultat(
            @RequestParam("etudiant") String etudiantEmail,
            @RequestParam("cours") String coursNom,
            @RequestParam("note") String noteStr,
            @RequestParam("commentaire") String commentaire,
            @RequestParam("date") String dateStr,
            Model model) {

        try {
            // Validation et conversion des données
            Float note = Float.parseFloat(noteStr);
            Optional<Utilisateur> etudiant = utilisateurDAO.findById(etudiantEmail);
            Optional<Matiere> cours = Optional.ofNullable(matiereDAO.findByNom(coursNom));

            // Vérification des données
            if (etudiant.isEmpty() || cours.isEmpty()) {
                model.addAttribute("errorMessage", "L'étudiant ou le cours n'existe pas.");
                return "redirect:/enseignant/addResultat";
            }

            // Création de l'identifiant composite
            ResultatId resultatId = new ResultatId();
            resultatId.setEtudiant(etudiant.get().getEmail());
            resultatId.setMatiere(cours.get().getNom());
            resultatId.setDate(dateStr);

            // Création de l'objet Resultat
            Resultat resultat = new Resultat();
            resultat.setId(resultatId);
            resultat.setEtudiant(etudiant);
            resultat.setCours(cours);
            resultat.setNote(note);
            resultat.setCommentaire(commentaire);

            // Sauvegarde dans la base de données
            resultatDAO.save(resultat);

            return "redirect:/enseignant/listResultats"; // Redirection après succès
        } catch (NumberFormatException e) {
            model.addAttribute("errorMessage", "La note doit être un nombre valide.");
            return "redirect:/enseignant/addResultat";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "Erreur lors de l'ajout du résultat.");
            return "redirect:/enseignant/addResultat";
        }
    }
}
