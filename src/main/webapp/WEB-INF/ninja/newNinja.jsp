<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Ninja</title>
    <!-- for Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <!-- For any Bootstrap that uses JS or jQuery-->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<header class="row d-flex align-items-center">
		   	<div class="col">
			   	<h1>New Ninja</h1>
		   	</div>
		   	<div class="col text-end">
		   		<a href="/dojo">Dashboard</a>
		   		<a href="/dojo/new">Add Dojo</a>
		   	</div>
		</header>
		<form:form action="/ninjas/create" method="post" modelAttribute="ninja">
			<div>
				<form:label path="dojo">Dojo</form:label>
				<form:select path="dojo">
					<c:forEach var="dojo" items="${dojos}">
						<form:option value="${dojo}">
							<c:out value="${dojo.getName()}"/>
						</form:option>
					</c:forEach>
				</form:select>
				<form:errors path="dojo"/>
			</div>
			<div>
				<form:label path="first_name">First Name</form:label>
				<form:input path="first_name"/>
				<form:errors path="first_name"/>
			</div>
			<div>
				<form:label path="last_name">Last Name</form:label>
				<form:input path="last_name"/>
				<form:errors path="last_name"/>
			</div>
			<div>
				<form:label path="age">Age</form:label>
				<form:input path="age" type="number" min="1"/>
				<form:errors path="age"/>
			</div>
			<input type="submit" value="Create"/>
		</form:form>
	</div>
</body>
</html>