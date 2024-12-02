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
            var matiereFilter = document.getElementById('matiere').value.toLowerCase();
            var rows = document.querySelectorAll('table tbody tr');

            rows.forEach(row => {
                var studentName = row.querySelector('td.student').textContent.toLowerCase();
                var courseName = row.querySelector('td.course').textContent.toLowerCase();

                if (studentName.includes(studentFilter) && (matiereFilter === '' || courseName.includes(matiereFilter))) {
                    row.style.display = ''; // Afficher la ligne
                } else {
                    row.style.display = 'none'; // Masquer la ligne
                }
            });
        }
    </script>
</head>
<body>
<header id="headerleft">
    <a href="<%= request.getContextPath() %>/redirectionServlet">
        <img src="${pageContext.request.contextPath}/cyent.png" alt="Logo" class="animated-logo" style="height: 7em;">
    </a>
    <div id="deconnexion">
        <a href="<%= request.getContextPath() %>/logout">Se déconnecter</a>
    </div>
</header>
<h1>Liste de toutes les notes</h1>

<!-- Vérification que des résultats existent -->
<c:if test="${empty resultats}">
    <p>Aucun résultat trouvé.</p>
</c:if>

<!-- Filtres pour Étudiant et Cours -->
<div>
    <label for="studentFilter">Filtrer par étudiant :</label>
    <input type="text" id="studentFilter" onkeyup="filterResults()" style="width:100%;">

    <label for="matiere">Matière :</label>
    <select id="matiere" name="matiere" onchange="filterResults()">
        <option value="">Toutes les matières</option>
        <c:forEach var="matiere" items="${matieres}">
            <option value="${matiere.nom}">${matiere.nom}</option>
        </c:forEach>
    </select>
</div>
<br/>
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

</body>
</html>
