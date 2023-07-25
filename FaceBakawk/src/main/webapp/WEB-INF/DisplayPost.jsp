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
	 

</body>
</html>