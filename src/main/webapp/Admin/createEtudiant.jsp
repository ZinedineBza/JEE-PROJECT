<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Créer Etudiant</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<h1>Créer Etudiant</h1>

<c:if test="${not empty errors}">
        <div class="error">
            <c:forEach var="error" items="${errors}">
                ${error.value}
            </c:forEach>
        </div>
</c:if>

<form action="<%= request.getContextPath() %>/FormUser?type=etudiant" method="post">
    <input type="hidden" name="role" id="role" value="etudiant" required>

    <div class="form-group">
        <label for="nom">Nom:</label>
        <input type="text" name="nom" id="nom" value="${param.nom}" required>
    </div>

    <div class="form-group">
        <label for="prenom">Prenom:</label>
        <input type="text" name="prenom" id="prenom" value="${param.prenom}" required>
    </div>

    <div class="form-group">
        <label for="dateNaissance">Date de Naissance:</label>
        <input type="date" name="dateNaissance" id="dateNaissance" value="${param.dateNaissance}" required>
    </div>

    <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" name="email" id="email" value="${param.email}" required>
    </div>

    <div class="form-group">
        <label for="classe">Classe:</label>
        <select name="classe" id="classe" required>
            <option value="">Sélectionnez une classe</option>
            <c:forEach var="classe" items="${classes}">
                <option value="${classe}">${classe}</option>
            </c:forEach>
        </select>
    </div>

    <div class="form-group">
        <input type="submit" value="Créer">
    </div>
</form>
<h1><a href="${pageContext.request.contextPath}/listUsers?recherche=etudiant">Retour à la liste des etudiants</a></h1>
<br>
<h1><a href="${pageContext.request.contextPath}/redirectionServlet">Retour Accueil</a></h1>
</div>
</body>
</html>
