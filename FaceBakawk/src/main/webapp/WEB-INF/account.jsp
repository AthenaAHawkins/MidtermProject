<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account Profile</title>
</head>
<body>

	<%--Edit the file nav.jsp to change nav links --%>
	<%@ include file="nav.jsp"%>

	<c:choose>
		<c:when test="${not empty sessionScope.loggedInUser }">
			<h2>Your Account Details</h2>
			<%-- Output user details --%>

			<ul>
				<li>ID: ${loggedInUser.id }</li>
				<li>UserName: ${loggedInUser.username }</li>
				<li>FirstName: ${loggedInUser.firstName }</li>
				<li>LastName: ${loggedInUser.lastName }</li>
			</ul>
		</c:when>
		<c:otherwise>
			<h1>Not logged In.</h1>
		</c:otherwise>
	</c:choose>




</body>
</html>