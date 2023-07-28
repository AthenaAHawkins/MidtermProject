<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chicken Details</title>
<jsp:include page="bootStrapHead.jsp" />
<link rel="stylesheet" href="<c:url value="/static/css/navbar.css"/>">
<link rel="stylesheet" href="css/displayChicken.css">
</head>
<body>
<jsp:include page="navbar.jsp"/>
	<h1>Chicken Details</h1>



<c:choose>
    <c:when test="${not empty chicken.pictureURL}">
        <img src="${chicken.pictureURL}" alt="Chicken Picture" width="300" height="200">
    </c:when>
    <c:otherwise>
        <img src="${chicken.breed.pictureURL}" alt="Breed Picture" width="300" height="200">
    </c:otherwise>
</c:choose>
	<h2> ${chicken.name} </h2>
	<p class="backgroundWhite">Owner:
	 <a href="getUser.do?userId=${chicken.owner.id}"> ${chicken.owner.username}</a>
	<br>Breed:
	<a href="getBreed.do?breedId=${chicken.breed.id}">${chicken.breed.name}</a>
	<br>Gender:
	 ${chicken.gender} 
	<br>Height:
	 ${chicken.height} in. 
	<br>Do they want chicks:
	 ${chicken.wantsChicks} 
	<br>Birthday:
	 ${chicken.birthday} 
	<br>Music Taste:
	${chicken.musicTaste} 
	<br>Description:
	 ${chicken.description}

</p>

	<jsp:include page="bootStrapFoot.jsp" />
</body>
</html>