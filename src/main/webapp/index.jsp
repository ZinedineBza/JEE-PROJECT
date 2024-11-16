<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="createUser.jsp">creer etudiant</a>
<a href="<%= request.getContextPath() %>/listUsers">list etudiant</a>
</body>
</html>