<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Forum Comment Section</title>

<jsp:include page="bootStrapHead.jsp"/>
<link rel="stylesheet" href="css/displayPost.css">
</head>
<body>
<jsp:include page="navbar.jsp"/>

	<h2 > ${post.title} </h2>
	<br>
<img src="${post.pictureURL}" alt="${post.title}" width="300"
		height="200"> 
	<br>Author:
	 <a href="getUser.do?userId=${post.user.id}">${post.user.username}</a><br>
	 <p><em>${post.content } </em></p>
	 

<table class="table table-striped table-hover">
		<thead class="table-dark">
		<tbody>
			<c:forEach var="postComment" items="${commentList}">
				<tr>
					<td><img src="${postComment.user.pictureURL }" alt="This you?"
					width="30" height="30"><a id="yellow" href="getUser.do?userId=${postComment.user.id}">${postComment.user.username}</a>
</td>
				</tr>
					<tr>
					<td>Comment: ${postComment.postContent }</td>
					</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${not empty sessionScope.loggedInUser }">
	<div>
	

					<form action="addComment.do" method="POST">
					<textarea name="postContent" ></textarea>
					
					<input type="hidden" name="post.id" value="${post.id }">
					<input type="hidden" name="user.id" value="${sessionScope.loggedInUser.id }"><br>
					  <input type="submit" value="Comment On Post">
					  
					 </form>
					 </div>
		 </c:if>
		 <br>
		 
				<form action="displayAllPosts.do" method="post">
			<button class="btn btn-success" >Back To Forum Main Page</button>
		</form>
		
	
		
					  <jsp:include page="bootStrapFoot.jsp"/>
</body>
</html>