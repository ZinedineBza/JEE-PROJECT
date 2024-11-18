<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Liste des Résultats</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<h1>Liste de toutes les notes</h1>

<!-- Vérification que des résultats existent -->
<c:if test="${empty resultats}">
    <p>Aucun résultat trouvé.</p>
</c:if>

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
                <td>${resultat.etudiant.nom} ${resultat.etudiant.prenom}</td>
                <td>${resultat.cours.nom}</td>
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
<a href="${pageContext.request.contextPath}/addResultat.jsp">Ajouter un Résultat</a>

</body>
</html>
