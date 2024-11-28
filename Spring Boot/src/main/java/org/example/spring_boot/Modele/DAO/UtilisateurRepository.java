package org.example.spring_boot.Modele.DAO;
import org.example.spring_boot.Modele.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UtilisateurRepository extends JpaRepository<Utilisateur, String> {

    // Trouver un utilisateur par pseudo
    Utilisateur findByPseudo(String pseudo);

    // Vérifier l'existence d'un email
    boolean existsByEmail(String email);

    // Vérifier l'existence d'un pseudo
    boolean existsByPseudo(String pseudo);

    // Trouver des utilisateurs par rôle
    List<Utilisateur> findByRole(String role);

    // Trouver tous les étudiants
    @Query("FROM Utilisateur u WHERE u.role = 'ETUDIANT'")
    List<Utilisateur> findAllStudents();

    // Trouver les étudiants inscrits aux matières enseignées par un enseignant
    @Query("SELECT DISTINCT i.etudiant FROM Inscription i " +
            "JOIN i.matiere m " +
            "WHERE m.nom IN (SELECT c.matiere.nom FROM Cour c WHERE c.enseignant.email = :email)")
    List<Utilisateur> findEtudiantsInscritsAuxMatieres(@Param("email") String enseignantEmail);

    // Trouver les élèves par classe et matière
    @Query("SELECT i.etudiant FROM Inscription i " +
            "JOIN i.etudiant u " +
            "JOIN i.matiere m " +
            "WHERE u.classe.classe = :classe " +
            "AND m.nom = :matiere")
    List<Utilisateur> findElevesByClasseAndMatiere(@Param("classe") String classe, @Param("matiere") String matiere);

    Utilisateur findByIdEnseignant(String enseignantMail);
}
