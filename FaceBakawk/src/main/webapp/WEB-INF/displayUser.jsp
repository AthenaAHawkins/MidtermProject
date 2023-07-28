<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User info</title>
</head>
<jsp:include page="bootStrapHead.jsp"/>
<body class="userpage">
<jsp:include page="navbar.jsp"/>
	<h1 class="userdeets">User Details</h1>





	<img src="${user.pictureURL}" alt="${user.username}" width="300"

		height="200"> 
	<h3 class="userdeets">User Name: ${user.username}</h3>
	
	<h2 class="userdeets"> ${user.firstName} &nbsp; ${user.lastName }</h2>
	
	<br>
	<h2 class="userdeets">Description:
	 ${user.description}</h2>

	
	<br>


<jsp:include page="accountaccordion.jsp"/>
<jsp:include page="bootStrapFoot.jsp"/>

</body>
</html>