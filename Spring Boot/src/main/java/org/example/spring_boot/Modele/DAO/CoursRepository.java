package org.example.spring_boot.Modele.DAO;
import org.example.spring_boot.Modele.Cour;
import org.example.spring_boot.Modele.CourId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface CoursRepository extends JpaRepository<Cour, CourId> {

    @Query("SELECT c FROM Cour c JOIN FETCH c.matiere JOIN FETCH c.enseignant")
    List<Cour> findAllWithRelations();

    @Query("SELECT c FROM Cour c " +
            "JOIN FETCH c.matiere m " +
            "JOIN FETCH c.enseignant e " +
            "WHERE e.email = :email OR m IN (SELECT i.matiere FROM Inscription i WHERE i.etudiant.email = :email)")
    List<Cour> findByUtilisateur(@Param("email") String utilisateurEmail);

    @Query("SELECT c FROM Cour c WHERE c.matiere.nom = :matiereNom")
    List<Cour> findCoursByMatiere(@Param("matiereNom") String matiereNom);

    void delete(Optional<Cour> ancienCours);
}
