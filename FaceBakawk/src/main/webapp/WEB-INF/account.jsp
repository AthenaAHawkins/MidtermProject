<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account Profile</title>


<link rel="stylesheet" href="css/account.css">
<jsp:include page="bootStrapHead.jsp"/>
<link rel="stylesheet" href="<c:url value="/static/css/navbar.css"/>">
</head>

<body id="accountpage">

	<%--Edit the file nav.jsp to change nav links --%>
	<jsp:include page="navbar.jsp" />
<div class="container" >
	<c:choose>
		<c:when test="${not empty sessionScope.loggedInUser }">
			<h2 class="unique-text">Your Account Details</h2>
			<%-- Output user details --%>

<ul class="no-bullet">
  <li><img src="${loggedInUser.pictureURL}" alt="This you?" width="300" height="200"></li>
  <li><span class="label">Username:</span> <span class="content">${loggedInUser.username}</span></li>
  <li><span class="label">First Name:</span> <span class="content">${loggedInUser.firstName}</span></li>
  <li><span class="label">Last Name:</span> <span class="content">${loggedInUser.lastName}</span></li>
  <li><span class="label">City:</span> <span class="content">${loggedInUser.address.city}</span></li>
</ul>



			
		</c:when>
		<c:otherwise>
			<h1>Not logged In.</h1>
		</c:otherwise>
	</c:choose>
	<br>
	
</div>
	<jsp:include page="profileaccordionjsp.jsp" />
	<jsp:include page="bootStrapFoot.jsp" />
</body>
</html>