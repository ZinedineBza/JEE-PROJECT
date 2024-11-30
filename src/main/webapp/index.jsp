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
            <!-- Formulaire de connexion -->
            <form id="loginForm" action="auth" method="post">
                <div class="form-group">
                    <label for="username">Pseudo :</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Mot de passe :</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn">Se connecter</button>
                </div>
                <div class="form-group">
                    <a href="javascript:void(0);" onclick="showForgotPasswordForm()">Mot de passe oublié ?</a>
                </div>
            </form>

            <!-- Formulaire de réinitialisation de mot de passe -->
            <form id="forgotPasswordForm" action="forgotPasswordServlet" method="post" style="display:none;">
                <div class="form-group">
                    <label for="email">Adresse e-mail :</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn">Envoyer le lien de réinitialisation</button>
                </div>
                <div class="form-group">
                    <a href="javascript:void(0);" onclick="showLoginForm()">Retour à la connexion</a>
                </div>
            </form>
    </body>
<script>
    function showForgotPasswordForm() {
        document.getElementById('loginForm').style.display = 'none';
        document.getElementById('forgotPasswordForm').style.display = 'block';
    }

    function showLoginForm() {
        document.getElementById('loginForm').style.display = 'block';
        document.getElementById('forgotPasswordForm').style.display = 'none';
    }
</script>
</html>
