<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="home.do">Home</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="getEvents.do">Eggcelent Events</a></li>
					<li class="nav-item"><a class="nav-link" href="displayAllPosts.do">Forums</a></li>

			<c:choose>

				<c:when test="${not empty sessionScope.loggedInUser }">
					<li class="nav-item"><a class="nav-link" href="account.do">My Profile</a></li>
					<li class="nav-item"><a class="nav-link" href="logout.do">Logout</a></li>
					<li class="nav-item"><a class="nav-link" href="matchmaker.do">Matchmaker</a></li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a class="nav-link" href="login.do">Sign In/Sign Up</a></li>

				</c:otherwise>
			</c:choose>



		</ul>
	</div>
</nav> 