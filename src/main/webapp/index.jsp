<%-- <% response.sendRedirect("customer/list"); %> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Welcome To Home Page</h2>
<hr>
<a href="${pageContext.request.contextPath}/customer/list">View Customer List</a>
<hr>
<security:authorize access="hasRole('EMPLOYEE')">
   <a href="${pageContext.request.contextPath}/employees">Employee Meeting</a>
   <hr>
</security:authorize>
<security:authorize access="hasRole('MANAGER')">
   <a href="${pageContext.request.contextPath}/managers">Manager Meeting</a>
   <hr>
</security:authorize>
<security:authorize access="hasRole('ADMIN')">
   <a href="${pageContext.request.contextPath}/admins">Admin Meeting</a>
   <hr>
</security:authorize>

</body>
</html>