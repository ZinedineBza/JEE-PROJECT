package jeeprojet.application.Servlet.Inscription;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jeeprojet.application.Modele.DAO.InscriptionDAO;
import jeeprojet.application.Modele.Inscription;
import jeeprojet.application.Modele.Utilisateur;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@WebServlet("/ListInscriptionServlet")
public class ListInscriptionServlet extends HttpServlet {
    private InscriptionDAO inscriptionDAO;

    @Override
    public void init() {
        inscriptionDAO = new InscriptionDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");
        List<Inscription> inscriptions = new ArrayList<>();
        if (Objects.equals(utilisateur.getRole(), "admin")) {
            inscriptions = inscriptionDAO.findAll();

        }else{
            inscriptions = inscriptionDAO.findCoursUtilisateur(utilisateur.getEmail());
        }
        request.setAttribute("inscriptions", inscriptions);
        request.getRequestDispatcher("Admin/listInscription.jsp").forward(request, response);
    }
}
