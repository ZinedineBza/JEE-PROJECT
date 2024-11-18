<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Résultats de l'étudiant</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <h1>Résultats de ${etudiant.nom} ${etudiant.prenom}</h1>

    <table border="1">
        <thead>
            <tr>
                <th>Matière</th>
                <th>Moyenne</th>
                <th>Notes</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="entry" items="${resultatsParMatiere}">
                <tr>
                    <td>${entry.matiere}</td>
                    <td>${entry.moyenne}</td>
                    <td>
                        <c:forEach var="note" items="${entry.notes}">
                            ${note}<br>
                        </c:forEach>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
        <tfoot>
            <tr>
                <td><strong>Moyenne Générale</strong></td>
                <td colspan="2">
                    ${moyenneGenerale}
                </td>
            </tr>
        </tfoot>
    </table>

    <!-- Bouton pour générer un PDF -->
    <form action="${pageContext.request.contextPath}/generatePDF" method="get">
        <input type="hidden" name="etudiantEmail" value="${etudiant.email}" />
        <button type="submit">Générer PDF</button>
    </form>

    <a href="${pageContext.request.contextPath}/selectStudent">Retour</a>
</body>
</html>
