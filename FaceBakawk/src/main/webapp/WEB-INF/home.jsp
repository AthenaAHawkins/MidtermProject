<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FaceBaKawk</title>
<jsp:include page="bootStrapHead.jsp"/>
</head>
<body>


<jsp:include page="navbar.jsp"/>
<h1>WELCOME BA-KAWK!</h1>


<h1>Chicken in the Spotlight</h1>
	
    <c:if test="${empty spotlight}">
        <p>No spotlight to spotlight.</p>
    </c:if>
    <c:if test="${not empty spotlight}">
    	
       
        
         <a href="getChicken.do?spotlightId=${spotlight.id}">${spotlight.name}</a> 
         <p>proud parent: <a href="getUser.do?userId=${spotlight.owner.id}"> ${spotlight.owner.username}</a>
        <p>Chicken Birthday: ${spotlight.birthday} </p>
        <a href="getBreed.do?breedId=${spotlight.breed.id}">${spotlight.breed.name}</a>
        
      <p>Chicken Description: ${spotlight.description}</p> 
      
				<c:choose>
							<c:when test="${not empty spotlight.pictureURL}">
								<a href="getChicken.do?spotlightId=${spotlight.id}"> <img
									src="${spotlight.pictureURL}" alt="Chicken Picture" width="300"
									height="200"></a>
							</c:when>
							<c:otherwise>
								<a href="getChicken.do?spotlightId=${spotlight.id}"> <img
									src="${spotlight.breed.pictureURL}" alt="Breed Picture"
									width="300" height="200"></a>
							</c:otherwise>
					</c:choose>
        
        
    </c:if>




<jsp:include page="bootStrapFoot.jsp"/>
</body>
</html>