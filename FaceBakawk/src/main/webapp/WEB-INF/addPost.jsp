<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="addPost.do" method="POST">

		<h2>Tell us about your event:</h2>

		<input type="hidden" name="postId" value="${post.id}"> <label
			for="title">Title:</label><br> <input type="text" name="title"><br>

		<label for="content">About Your Post:</label><br>
		<textarea name="content" rows="5" cols="40"></textarea>
		 <input type="submit" value="Post">
		<br>
		 <a href="account.do">Back to Home</a>
	</form>

</body>
</html>