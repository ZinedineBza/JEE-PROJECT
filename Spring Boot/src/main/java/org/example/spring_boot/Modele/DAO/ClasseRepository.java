package org.example.spring_boot.Modele.DAO;

import org.example.spring_boot.Modele.Classe;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClasseRepository extends JpaRepository<Classe, String> {
    // JpaRepository fournit déjà les méthodes findById et findAll
}
