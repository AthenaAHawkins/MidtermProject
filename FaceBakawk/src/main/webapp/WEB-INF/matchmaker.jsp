<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
   <title>Chicken Pairs</title>
</head>
<body>
   <h1>Chicken Pairs</h1>

   <table>
       <c:forEach var="pair" items="${matchedPairs}">
           <tr>
               <td>${pair[0].name}</td>
               <td>${pair[1].name}</td>
           </tr>
       </c:forEach>
   </table>
</body>
</html>