// ExempleServlet.java
package jeeprojet.application.Servlet.User;

import jakarta.servlet.annotation.WebServlet;
import jeeprojet.application.Modele.Classe;
import jeeprojet.application.Modele.DAO.ClasseDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
@WebServlet("/FormUser")
public class CreateUserFormServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        
        if ("etudiant".equalsIgnoreCase(type)) {
            // Récupérer les classes pour les étudiants
            ClasseDAO classeDAO = new ClasseDAO();
            List<Classe> classes = classeDAO.findAll();

            request.setAttribute("classes", classes);
            request.setAttribute("type", "etudiant");
            request.getRequestDispatcher("/Admin/createEtudiant.jsp").forward(request, response);
        } else if ("enseignant".equalsIgnoreCase(type)) {
            request.setAttribute("type", "enseignant");
            request.getRequestDispatcher("/Admin/createEnseignant.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }
}