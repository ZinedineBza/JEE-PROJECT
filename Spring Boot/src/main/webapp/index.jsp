<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Connexion</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<h1>Connexion</h1>

<!-- Affichage des messages d'erreur -->
<div class="error">
    <c:if test="${not empty errorMessage}">
        <c:choose>
            <c:when test="${errorMessage == 'invalid'}">
                <p style="color:red;">Identifiants invalides. Veuillez réessayer.</p>
            </c:when>
            <c:when test="${errorMessage == 'empty'}">
                <p style="color:red;">Veuillez remplir tous les champs.</p>
            </c:when>
        </c:choose>
    </c:if>
</div>

<!-- Formulaire de connexion -->
<form action="/auth" method="post">
    <div class="form-group">
        <label for="username">Pseudo :</label>
        <input type="text" id="username" name="username" required>
    </div>

    <div class="form-group">
        <label for="password">Mot de passe :</label>
        <input type="password" id="password" name="password" required>
    </div>

    <div class="form-group">
        <button type="submit">Se connecter</button>
    </div>
</form>
</body>
</html>
