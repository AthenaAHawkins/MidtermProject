<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav>
	<ul>
	
	  <li> <a href="home.do">Home</a> </li>
	  <c:choose>
	  <c:when test="${not empty sessionScope.loggedInUser }">
	  	<li ><a href ="account.do">My Profile</a></li>
	  	<li ><a href ="logout.do">Log Out</a></li>
	  	<li><a href="matchmaker.do">Match Maker</a></li>
	  </c:when>
	  <c:otherwise>
	  		<li><a href="login.do">Log In</a></li>
	  		</c:otherwise>
	  	</c:choose>
	</ul>
</nav>