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
    <title>New Dojo</title>
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
			   	<h1>New Dojo</h1>
		   	</div>
		   	<div class="col text-end">
		   		<a href="/dojo">Dashboard</a>
		   		<a href="/ninjas/new">Add Ninja</a>
		   	</div>
		</header>
   	<div class="row">
   		<form:form action="/dojo/create" method="post" modelAttribute="dojo">
   			<div class="mb-3">
   				<form:label path="name">Name:</form:label>
   				<form:input path="name"/>
   				<form:errors path="name"/>
   			</div>
   			<input type="submit" value="Create"/>
   		</form:form>
   	</div>
   </div>
</body>
</html>