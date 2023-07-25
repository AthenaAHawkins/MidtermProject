<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>User Successfully added</h2>


	<button onclick="redirectToAccount()">Back to Account</button>

	<script>
		function redirectToAccount() {
			window.location.href = 'account.do';
		}
	</script>

</body>
</html>
