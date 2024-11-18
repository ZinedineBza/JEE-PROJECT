<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Étudiants</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <h1>Liste des Étudiants</h1>

    <table border="1">
        <thead>
            <tr>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Email</th>
                <th>Voir le Bulletin</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="etudiant" items="${etudiants}">
                <tr>
                    <td>${etudiant.nom}</td>
                    <td>${etudiant.prenom}</td>
                    <td>${etudiant.email}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/studentResults?etudiantEmail=${etudiant.email}">Voir le Bulletin</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
