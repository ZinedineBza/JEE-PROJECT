package jeeprojet.application.Servlet.Etudiant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.Classe;
import jeeprojet.application.Modele.DAO.ClasseDAO;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;


@WebServlet("/getClasses")
public class GetClassesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Classe> classes = new ArrayList<>();

        // Récupérer les classes associées à cette matière
        ClasseDAO classeDAO = new ClasseDAO();
        classes = classeDAO.findAll();

        // Répondre directement avec des options HTML
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        // Concaténer chaque classe dans une balise <option> HTML
        StringBuilder options = new StringBuilder();
        options.append("<option value=''>Sélectionnez une classe</option>");
        for (Classe classe : classes) {
            options.append("<option value='").append(classe).append("'>").append(classe).append("</option>");
        }
        System.out.println(classes);

        response.getWriter().write(options.toString());
    }
}
