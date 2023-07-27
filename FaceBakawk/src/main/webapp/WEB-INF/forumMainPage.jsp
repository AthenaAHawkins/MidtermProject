<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forum Page</title>
<jsp:include page="bootStrapHead.jsp"/>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<h1>Forum</h1>

<c:if test="${not empty sessionScope.loggedInUser}">
<p>Create an Event</p>
 <p><a href="createPost.do">Create an Event</a></p>
  <p><a href="updatePost.do">Update an Event</a></p>
 
 
</c:if>

<table>
    <c:forEach items="${postList}" var="post">
        <tr>
            <td><a href="displayPost.do?postId=${post.id}">${post.title}</a></td>
            <td>${post.user.username}</td>
            <td>${post.postDate}</td>
        </tr>
    </c:forEach>
</table>
<jsp:include page="bootStrapFoot.jsp"/>
</body>
</html>