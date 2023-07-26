<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chicken Details</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
	<h1>Chicken Details</h1>



<c:choose>
    <c:when test="${not empty chicken.pictureURL}">
        <img src="${chicken.pictureURL}" alt="Chicken Picture">
    </c:when>
    <c:otherwise>
        <img src="${chicken.breed.pictureURL}" alt="Breed Picture">
    </c:otherwise>
</c:choose>
	<h2> ${chicken.name} </h2>
	<br>Owner:
	 <a href="getUser.do?userId=${loggedInUser.id}"> ${chicken.owner.username}</a>
	<br>Breed:
	${chicken.breed.name}
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





	<%-- </c:forEach> --%>



</body>
</html>