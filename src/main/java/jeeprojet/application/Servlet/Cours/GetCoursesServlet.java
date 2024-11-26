package jeeprojet.application.Servlet.Cours;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.DAO.CoursDAO;
import jeeprojet.application.Modele.Cour;

import java.io.IOException;
import java.util.List;

import java.io.PrintWriter;

@WebServlet("/getCourses")
public class GetCoursesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String matiereId = request.getParameter("matiereId");

        CoursDAO coursDAO = new CoursDAO();
        List<Cour> coursList = coursDAO.findCoursByMatiere(matiereId);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        for (Cour cours : coursList) {
            out.println("<tr>");
            out.println("<td>" + cours.getNom() + "</td>");
            out.println("<td>" + cours.getEnseignant().getNom() + "</td>");
            out.println("<td><button class='emploi-du-temps-btn' data-email='" + cours.getEnseignant().getEmail() + "'>Voir emploi du temps</button></td>");
            out.println("</tr>");
        }
        out.close();
    }
}





