<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Connexion</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<h1>Connexion</h1>

<%
    String errorMessage = request.getParameter("error");
    if (errorMessage != null) {
        if (errorMessage.equals("invalid")) {
%>
<div class="error"><p style="color:red;">Identifiants invalides. Veuillez réessayer.</p>
<%
} else if (errorMessage.equals("empty")) {
%>
<p style="color:red;">Veuillez remplir tous les champs.</p>
<%
        }
    }
%>
</div>
<form action="auth" method="post">
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
