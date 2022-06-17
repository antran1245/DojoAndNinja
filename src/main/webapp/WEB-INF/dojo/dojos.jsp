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
    <title>Dojos</title>
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
		   	<h1>Dojos</h1>
	   	</div>
	   	<div class="col text-end">
	   		<a href="/dojo/new">Create Dojo</a>
	   		<a href="/ninjas/new">Add Ninja</a>
	   	</div>
	</header>
   	<div class="row">
   		<table class="table table-striped">
   			<thead>
   				<tr>
   					<th scope="col">#</th>
   					<th scope="col">Name</th>
   				</tr>
   			</thead>
   			<tbody>
   				<c:forEach var="dojo" items="${dojos}">
   					<tr>
   						<th scope="row"><c:out value="${dojo.getId()}"/></th>
   						<td><a href="/dojo/${dojo.getId()}"><c:out value="${dojo.getName()}"/></a></td>
   					</tr>
   				</c:forEach>
   			</tbody>
   		</table>
   	</div>
   </div>
</body>
</html>