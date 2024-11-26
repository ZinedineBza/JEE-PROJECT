package jeeprojet.application.Servlet.Enseignant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jeeprojet.application.Modele.Cour;
import jeeprojet.application.Modele.DAO.CoursDAO;

import java.io.IOException;
import java.util.List;

@WebServlet("/emploiDuTempsProf")
public class EmploiDuTempsProfServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String profEmail = request.getParameter("email");
        CoursDAO coursDAO = new CoursDAO();
        List<Cour> cours = coursDAO.findByUtilisateur(profEmail);
        request.setAttribute("cours", cours);
        request.getRequestDispatcher("Admin/modifCours.jsp").forward(request, response);

    }
}
