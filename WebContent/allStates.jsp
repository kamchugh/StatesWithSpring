<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="States.css" />
<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>States</title>
</head>
<body>
<header>
<p class="headertext"> US States </p>
</header>
<div class="statetable">
<%-- 	<c:choose>
		<c:when test="${! empty state}">
		<h1 class="headertext"> Information for ${state.name} </h1>
		 --%>
		<c:forEach var="state" items="${states}">
							<c:if test="${! empty(state)}">
   				<p> Abbreviation: ${state.abbreviation} </p>
				<p> Capital: ${state.capital} </p>
				<p> Capital Population: ${state.population} </p>
				<p> State Dessert: ${state.dessert } </p> <br>
							</c:if>
						</c:forEach></td>
		<%-- </c:when>
		<c:otherwise>
			<p>No state found</p>
		</c:otherwise>
	</c:choose>
 --%>

</body>
<footer>
<p> Designed by Kaylee McHugh </p>
</footer>

</html>