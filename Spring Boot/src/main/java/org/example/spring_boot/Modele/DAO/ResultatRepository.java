package org.example.spring_boot.Modele.DAO;
import org.example.spring_boot.Modele.Matiere;
import org.example.spring_boot.Modele.Resultat;
import org.example.spring_boot.Modele.ResultatId;
import org.example.spring_boot.Modele.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface ResultatRepository extends JpaRepository<Resultat, ResultatId> {

    // Trouver les résultats d'un étudiant
    List<Resultat> findByEtudiant(Optional<Utilisateur> etudiant);

    // Trouver les résultats d'une matière
    List<Resultat> findByCours(Matiere matiere);

    // Calculer la moyenne des notes pour un étudiant
    @Query("SELECT AVG(r.note) FROM Resultat r WHERE r.etudiant = :etudiant")
    Double calculerMoyenneParEtudiant(@Param("etudiant") Utilisateur etudiant);

    // Calculer la moyenne des notes pour un cours
    @Query("SELECT AVG(r.note) FROM Resultat r WHERE r.cours = :cours")
    Double calculerMoyenneParCours(@Param("cours") Matiere cours);

    // Calculer la moyenne des notes pour un étudiant dans un cours donné
    @Query("SELECT AVG(r.note) FROM Resultat r WHERE r.cours = :cours AND r.etudiant = :etudiant")
    Double calculerMoyenneParEtudiantEtCours(@Param("cours") Matiere cours, @Param("etudiant") Utilisateur etudiant);

    // Trouver les résultats donnés par un enseignant
    @Query("SELECT r FROM Resultat r " +
            "WHERE r.cours.nom IN (SELECT c.matiere.nom FROM Cour c WHERE c.enseignant.email = :email)")
    List<Resultat> findResultatByEnseignant(@Param("email") String emailEnseignant);

    Resultat get(ResultatId id);

    void update(Resultat resultat);

    List<Resultat> getAll();

    List<Resultat> consulterResultatsParEtudiant(Optional<Utilisateur> etudiant);

    Matiere findCoursByName(String nomCours);

    List<Resultat> obtenirToutesLesNotes();
}
