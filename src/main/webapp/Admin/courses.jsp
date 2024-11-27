<%@ page import="jeeprojet.application.Modele.Utilisateur" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Récupérer l'utilisateur de la session
    Utilisateur utilisateur = (Utilisateur) session.getAttribute("user");
    String role = "";

    if (utilisateur == null) {
        response.sendRedirect( request.getContextPath() + "/redirectionServlet");
    } else {
        role = utilisateur.getRole();
    }
%>
<table border="1">
    <thead>
    <tr>
        <th>Matière</th>
        <th>Enseignant</th>
        <th>Salle</th>
        <th>Date de Début</th>
        <th>Horaire</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="cours" items="${listCourses}">
        <tr>
            <td>${cours.matiere.nom}</td>
            <td>${cours.enseignant.nom}</td>
            <td>${cours.salle}</td>
            <td>${cours.dateDebut}</td>
            <td>${cours.horaire}</td>
            <td>
                <button class="show-students" data-course-id="${cours.id}">Voir les élèves</button> |
                <a href="${pageContext.request.contextPath}/updateCourse?id=${cours.id}">Modifier</a> |
                <a href="${pageContext.request.contextPath}/deleteCourse?id=${cours.id}">Supprimer</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
