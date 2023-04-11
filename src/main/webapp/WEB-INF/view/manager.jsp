<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Welcome To Manager Meeting!</h2>
<hr>
User : <sec:authentication property="principal.username"/>
<br>
Role : <sec:authentication property="principal.authorities"/>
<br><br>
<a href="${pageContext.request.contextPath}/">Go Back To Home Page</a>
<br><br>
<form:form action="${pageContext.request.contextPath}/logout" method="POST">
<input type="submit" value="logout"/>
</form:form>

</body>
</html>