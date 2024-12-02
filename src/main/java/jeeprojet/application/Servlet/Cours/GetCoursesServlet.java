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
        List<Object[]> coursCountList = coursDAO.findCoursCountByMatiere(matiereId);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        for (Object[] coursCount : coursCountList) {
            String profName = (String) coursCount[0];
            String profEmail = (String) coursCount[1];
            int courseCount = ((Long) coursCount[2]).intValue();
            out.println("<tr>");
            out.println("<td>" + profName + "</td>");
            out.println("<td>" + courseCount + "</td>");
            out.println("<td><button class='emploi-du-temps-btn' data-email='" + profEmail + "'>Voir emploi du temps</button></td>");
            out.println("</tr>");
        }
        out.close();
    }
}





