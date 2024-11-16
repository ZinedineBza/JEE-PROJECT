<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Résultats</title>
</head>
<body>
<h1>Liste des Résultats</h1>
<table border="1">
    <tr>
        <th>Étudiant</th>
        <th>Cours</th>
        <th>Note</th>
        <th>Commentaire</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="resultat" items="${resultats}">
        <tr>
            <td>${resultat.etudiant.nom}</td>
            <td>${resultat.cours.nom}</td>
            <td>${resultat.note}</td>
            <td>${resultat.commentaire}</td>
            <td>
                <form action="updateResultat" method="post">
                    <input type="hidden" name="etudiant" value="${resultat.id.etudiant}"/>
                    <input type="hidden" name="cours" value="${resultat.id.cours}"/>
                    <input type="text" name="note" value="${resultat.note}"/>
                    <input type="text" name="commentaire" value="${resultat.commentaire}"/>
                    <input type="submit" value="Modifier"/>
                </form>
                <form action="deleteResultat" method="post">
                    <input type="hidden" name="etudiant" value="${resultat.id.etudiant}"/>
                    <input type="hidden" name="cours" value="${resultat.id.cours}"/>
                    <input type="submit" value="Supprimer"/>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="addResultatForm.jsp">Ajouter un Résultat</a>
</body>
</html>
