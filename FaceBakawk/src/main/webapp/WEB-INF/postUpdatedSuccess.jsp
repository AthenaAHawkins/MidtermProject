<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post Successfuly Added</title>
</head>
<body>

<h2>Post Successfully added</h2>
	<jsp:include page="navbar.jsp"/>


	<button onclick="redirectToAccount()">Back to Account</button>

	<script>
		function redirectToAccount() {
			window.location.href = 'account.do';
		}
	</script>
	<jsp:include page="bootStrapFoot.jsp"/>

</body>
</html>