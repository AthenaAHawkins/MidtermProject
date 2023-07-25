<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<img src="${post.pictureURL}" alt="${post.title}" width="300"
		height="200"> 
	<h2> ${post.title} </h2>
	<br>
	Post Creator: 
	 <a href="getUser.do?userId=${post.user.id}">${post.user.username}</a>
	 <p><em>AITA: ${post.content } </em></p>
	 

<table class="table table-striped table-hover">
		<thead class="table-dark">
		<tbody>
			<c:forEach var="postComment" items="${commentList}">
				<tr>
					<td>User: ${postComment.user.username }</td>
					<td>
					<td>Comment: ${postComment.postContent }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
					<form action="displayPost.do" method="POST">
					
					<label for="postComment">Comment:</label><br>
					<input type="text" name="postComment" ><br>
					
					
					  <input type="submit" value="Comment On Post">
					 </form>
</body>
</html>