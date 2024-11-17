<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Liste des Résultats</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<h1>Liste des Résultats</h1>

<!-- Vérification que des résultats sont passés -->
<c:if test="${empty resultats}">
    <p>Aucun résultat trouvé.</p>
</c:if>

<table border="1">
    <tr>
        <th>Étudiant</th>
        <th>Cours</th>
        <th>Note</th>
        <th>Commentaire</th>
        <th>Modifier</th>
        <th>Supprimer</th>
    </tr>
    <c:forEach var="resultat" items="${resultats}">
        <tr>
            <td>${resultat.etudiant.nom}</td>
            <td>${resultat.cours.nom}</td>
            <td>${resultat.note}</td>
            <td>${resultat.commentaire}</td>
            <td>
                <!-- Formulaire de modification -->
                <form action="updateResultat" method="post">
                    <input type="hidden" name="etudiant" value="${resultat.id.etudiant}"/>
                    <input type="hidden" name="cours" value="${resultat.id.cours}"/>
                    <input type="hidden" name="date" value="${resultat.id.date}"/>
                    <input type="number" name="note" value="${resultat.note}" step="any" min="0" max="20"/>
                    <input type="hidden" name="commentaire" value="${resultat.commentaire}"/>
                    <input type="submit" value="Modifier"/>
                </form>
            </td>
            <td>
                <!-- Formulaire de suppression -->
                <form action="deleteResultat" method="post">
                    <input type="hidden" name="etudiant" value="${resultat.id.etudiant}"/>
                    <input type="hidden" name="cours" value="${resultat.id.cours}"/>
                    <input type="hidden" name="date" value="${resultat.id.date}"/>
                    <input type="submit" value="Supprimer"/>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- Lien pour ajouter un nouveau résultat -->
<a href="Resultat/addResultat.jsp">Ajouter un Résultat</a>

</body>
</html>
