<%@ page import="jeeprojet.application.Modele.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
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
<head>
    <title>Liste des Résultats</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
    <script>
        function filterResults() {
            var studentFilter = document.getElementById('studentFilter').value.toLowerCase();
            var courseFilter = document.getElementById('courseFilter').value.toLowerCase();
            var rows = document.querySelectorAll('table tbody tr');

            rows.forEach(row => {
                var studentName = row.querySelector('td.student').textContent.toLowerCase();
                var courseName = row.querySelector('td.course').textContent.toLowerCase();

                if (
                    studentName.includes(studentFilter) &&
                    courseName.includes(courseFilter)
                ) {
                    row.style.display = ''; // Afficher la ligne
                } else {
                    row.style.display = 'none'; // Masquer la ligne
                }
            });
        }
    </script>
</head>
<body>
<h1>Liste de toutes les notes</h1>

<!-- Vérification que des résultats existent -->
<c:if test="${empty resultats}">
    <p>Aucun résultat trouvé.</p>
</c:if>

<!-- Filtres pour Étudiant et Cours -->
<div>
    <label for="studentFilter">Filtrer par étudiant :</label>
    <input type="text" id="studentFilter" onkeyup="filterResults()">

    <label for="courseFilter">Filtrer par cours :</label>
    <input type="text" id="courseFilter" onkeyup="filterResults()">
</div>

<!-- Table pour afficher les résultats -->
<table border="1">
    <thead>
        <tr>
            <th>Étudiant</th>
            <th>Cours</th>
            <th>Date</th>
            <th>Note</th>
            <th>Commentaire</th>
            <th>Modifier</th>
            <th>Supprimer</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="resultat" items="${resultats}">
            <tr>
                <td class="student">${resultat.etudiant.nom} ${resultat.etudiant.prenom}</td>
                <td class="course">${resultat.cours.nom}</td>
                <td>${resultat.id.date}</td>
                <td>${resultat.note}</td>
                <td>${resultat.commentaire}</td>
                <td>
                    <!-- Formulaire de modification -->
                    <form action="${pageContext.request.contextPath}/updateResultat" method="post">
                        <input type="hidden" name="etudiant" value="${resultat.id.etudiant}" />
                        <input type="hidden" name="cours" value="${resultat.id.cours}" />
                        <input type="hidden" name="date" value="${resultat.id.date}" />
                        <input type="number" name="note" value="${resultat.note}" step="0.1" min="0" max="20" />
                        <input type="hidden" name="commentaire" value="${resultat.commentaire}" />
                        <input type="submit" value="Modifier" />
                    </form>
                </td>
                <td>
                    <!-- Formulaire de suppression -->
                    <form action="${pageContext.request.contextPath}/deleteResultat" method="post">
                        <input type="hidden" name="etudiant" value="${resultat.id.etudiant}" />
                        <input type="hidden" name="cours" value="${resultat.id.cours}" />
                        <input type="hidden" name="date" value="${resultat.id.date}" />
                        <input type="submit" value="Supprimer" />
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<!-- Lien pour ajouter un nouveau résultat -->
<a href="${pageContext.request.contextPath}/addResultatEnseignant">Ajouter un Résultat</a>
<a href="${pageContext.request.contextPath}/redirectionServlet">Retour Accueil</a>

</body>
</html>
