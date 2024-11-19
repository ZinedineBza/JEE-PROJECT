<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Connexion</title>
</head>
<body>
<h2>Connexion</h2>

<%
    String errorMessage = request.getParameter("error");
    if (errorMessage != null) {
        if (errorMessage.equals("invalid")) {
%>
<p style="color:red;">Identifiants invalides. Veuillez réessayer.</p>
<%
} else if (errorMessage.equals("empty")) {
%>
<p style="color:red;">Veuillez remplir tous les champs.</p>
<%
        }
    }
%>

<form action="auth" method="post">
    <label for="username">Pseudo :</label>
    <input type="text" id="username" name="username" required><br>

    <label for="password">Mot de passe :</label>
    <input type="password" id="password" name="password" required><br>

    <button type="submit">Se connecter</button>
</form>

<a href="auth/register.jsp">S'inscrire</a>
</body>
</html>
