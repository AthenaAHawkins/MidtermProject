<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FaceBaKawk</title>
<link rel="stylesheet" type="text/css" href="css/home.css">
<jsp:include page="bootStrapHead.jsp"/>
</head>
<body>
<h1 id="title">FACE BA-KAWK</h1>
<jsp:include page="navbar.jsp"/>

<div id="spotlight">
</div>

<div class = "box">
<div id="test">
<h3>Chicken in the Spotlight</h3>
	
    <c:if test="${empty spotlight}">
        <p>No spotlight to spotlight.</p>
    </c:if>
    <c:if test="${not empty spotlight}"> 
       <c:if test="${spotlight.enabled ==true }">
    	
        
         <a href="getChicken.do?chickenId=${spotlight.id}" id ="yellow">${spotlight.name}</a> 
         <p>proud parent: <a href="getUser.do?userId=${spotlight.owner.id}" id="yellow"> ${spotlight.owner.username}</a>
        <p>Chicken Birthday: ${spotlight.birthday} </p>
        <a href="getBreed.do?breedId=${spotlight.breed.id}" id="yellow">${spotlight.breed.name}</a>
        
      <p>Chicken Description: ${spotlight.description}</p> 
      
				<c:choose>
							<c:when test="${not empty spotlight.pictureURL}">
								<a href="getChicken.do?chickenId=${spotlight.id}" id="yellow"> <img
									src="${spotlight.pictureURL}" alt="Chicken Picture" width="300"
									height="200"></a>
							</c:when>
							<c:otherwise>
								<a href="getChicken.do?chickenId=${spotlight.id}" id = "yellow"> <img
									src="${spotlight.breed.pictureURL}" alt="Breed Picture"
									width="300" height="200"></a>
							</c:otherwise>
					</c:choose>
        
       </c:if>
       <c:if test="${spotlight.enabled ==false }">
       <br>
       <p>Chicken has been tenderized: ${spotlight.name }</p>
       <br>
       <img alt="chickentendies" src="https://www.marionskitchen.com/wp-content/uploads/2023/02/Asian-Buffalo-Wings-04.jpg" height="200px" width="200px">
       
       </c:if>
        
     </c:if> 
</div>
</div>


       


<jsp:include page="bootStrapFoot.jsp"/>
</body>
</html>