package org.example.spring_boot.Servlet.Etudiant;
import org.example.spring_boot.Modele.Classe;
import org.example.spring_boot.Modele.DAO.ClasseRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class GetClassesController {

    private ClasseRepository classeDAO;

    public GetClassesController(ClasseRepository classeDAO) {
        this.classeDAO = classeDAO;
    }

    @GetMapping("/api/getClasses")
    public String getClasses() {
        // Récupérer toutes les classes depuis le DAO
        List<Classe> classes = classeDAO.findAll();

        // Construire les balises <option> HTML
        StringBuilder options = new StringBuilder();
        options.append("<option value=''>Sélectionnez une classe</option>");
        for (Classe classe : classes) {
            options.append("<option value='")
                    .append(classe)
                    .append("'>")
                    .append(classe)
                    .append("</option>");
        }

        return options.toString();
    }
}
