<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.nay.springdemo.util.SortUtils" %>
<!DOCTYPE html>

<html>

<head>
<title>List Customers</title>

<!-- reference our style sheet -->

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link  href="<c:url value="/resources/css/bootstarp.min.css"/>" rel="stylesheet">

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
		</div>
	</div>

	<div id="container">

		<div id="content">

			<!-- put new button: Add Customer -->

			<input type="button" value="Add Customer"
				onclick="window.location.href='showFormForAdd'; return false;"
				class="add-button" />
			<form:form action="search" method="GET" class="row g-3">
			<div class="col-auto">
					<input type="text" readonly class="form-control-plaintext"
						value="Search customer:">
				</div>
				<div class="col-auto">
					<input type="text" name="theSearchName" class="form-control mb-3" />
				</div>
				<div class="col-auto">
					<input type="submit" value="Search"
						class="btn btn-outline-secondary mb-3" />
				</div>
			</form:form>

			<!--  add our html table here -->
			<c:url var="FirstName" value="/customer/list">
			<c:param name="sort" value="<%=Integer.toString(SortUtils.FIRST_NAME)%>"/>
			</c:url>
			<c:url var="LastName" value="/customer/list">
			<c:param name="sort" value="<%=Integer.toString(SortUtils.LAST_NAME)%>"/>
			</c:url>
			<c:url var="Email" value="/customer/list">
			<c:param name="sort" value="<%=Integer.toString(SortUtils.EMAIL)%>"/>
			</c:url>
 
			<table>
				<tr>
					<th><a href="${FirstName}">First Name</a></th>
					<th><a href="${LastName }">Last Name</a></th>
					<th><a href="${Email}">Email</a></th>
					<th>Action</th>
				</tr>

				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${customers}">

					<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>

					<!-- construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/customer/delete">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>

					<tr>
						<td>${tempCustomer.firstName}</td>
						<td>${tempCustomer.lastName}</td>
						<td>${tempCustomer.email}</td>

						<td>
							<!-- display the update link --> <a href="${updateLink}">Update</a>
							| <a href="${deleteLink}"
							onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
						</td>

					</tr>

				</c:forEach>

			</table>
			<form:form method="POST"
				action="${pageContext.request.contextPath}/logout">

				<input type="submit" value="logout" class="btn btn-secondary mt-4" />
			</form:form>

		</div>

	</div>


</body>

</html>









