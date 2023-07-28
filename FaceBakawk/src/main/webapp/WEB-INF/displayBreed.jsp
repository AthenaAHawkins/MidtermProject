<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Breed Details</title>
</head>
<jsp:include page="bootStrapHead.jsp"/>
<body>
<jsp:include page="navbar.jsp"/>
	<h1>Breed Details</h1>



        <img src="${breed.pictureURL}" alt="Chicken Picture" width="400" height="300">
	<h2> ${breed.name} </h2>
	<p class="backgroundWhite">${breed.characteristic}</p>



<jsp:include page="bootStrapFoot.jsp"/>
</body>
</html>