<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="bootStrapHead.jsp" />
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<form action="addPost.do" method="POST">


		<h2>Create a post:</h2>

		<input type="hidden" name="user.id" value="${sessionScope.loggedInUser.id}">
		 <label
			for="title">Title:</label><br> <input type="text" name="title"><br>

		<label for="content">About Your Post:</label><br>
		<textarea name="content" rows="5" cols="40"></textarea>
		<input type="submit" value="Post"> <br>
		 <a
			href="account.do">Back to Home</a>
	</form>
	<jsp:include page="bootStrapFoot.jsp" />

</body>
</html>