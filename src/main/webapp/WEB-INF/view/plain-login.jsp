<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/bootstarp.min.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div id="middle">
			<h3>My Custom Login Page</h3>
			<form
				action="${pageContext.request.contextPath}/authenticateTheUser"
				method="POST">
				<c:if test="${param.error!=null}">
					<div class="alert alert-danger col-sm-3">Sorry! You entered
						invalid username/password.</div>
				</c:if>
				<c:if test="${param.logout!=null}">
					<div class="alert alert-success col-sm-3">You have been
						logout</div>
				</c:if>
				<div class="row mb-3">
					<div class="col-sm-1">
						<label class="col-form-label">UserName :</label>
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="username">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-1">
						<label class="col-form-label">Password : </label>
					</div>
					<div class="col-sm-2">
						<input type="password" class="form-control" name="password">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-1">
					
					</div>
					<div class="col-sm-2">
					
						<input type="submit" value="Login"
							class="btn btn-primary mt-4 float-end" />
					</div>
					
				</div>
				<input type="hidden"
							   name="${_csrf.parameterName}"
							   value="${_csrf.token}" />
			</form>

			<%-- <a href="<c:url value = "/register/showRegistrationForm"/>">Register
					New User</a>
			<div> --%>
				<a href="${pageContext.request.contextPath}/register/showRegistrationForm">
				Register New User</a>
			</div>
		</div>
	
</body>
</html>