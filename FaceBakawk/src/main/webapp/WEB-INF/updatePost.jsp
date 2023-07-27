<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		
		<h3>Update Post</h3>
		<form action="updatePost.do" method="post">

			
			<input type="hidden" name=postId value = "${post.id }">
			<label for="title">Post Title </label><br>
			<input type="text" class="form-control" name="title" value="${post.title}">
			<label for="content">Post Content</label><br>
			<textarea name="content" rows="5" cols="40">${post.content}</textarea>

			
			<button class="btn btn-primary">Update Post</button>
		</form>
		

</body>
</html>