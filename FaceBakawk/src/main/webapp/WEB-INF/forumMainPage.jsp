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
 <p><a href="goToAddPost.do">Create a Post</a></p>
 
 
</c:if>

<table>
<thead>
<tr>
<th>
<u>Title:</u>
</th>
<th>
<u>Created By:</u>
</th>
</tr>

        <tbody>
    <c:forEach items="${postList}" var="post">
   
        <tr>
            <td><a href="displayPost.do?postId=${post.id}">${post.title}</a></td>
            <td>${post.user.username}</td>
            <td>${post.postDate}</td>
            
            
  <c:if test="${sessionScope.loggedInUser.id == post.user.id}">         
  <td><a href="goToUpdatePost.do?postId=${post.id}">Update post</a></td>
  <td><a href="disablePost.do?postId=${post.id }">Delete post</a>
  </c:if>
        </tr>
    </c:forEach>
        </tbody>
</table>
<jsp:include page="bootStrapFoot.jsp"/>
</body>
</html>