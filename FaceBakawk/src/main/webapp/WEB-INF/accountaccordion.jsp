<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<title>Bootstrap Example</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="p-3 m-0 border-0 bd-example m-0 border-0">
	<div class="accordion accordion-flush" id="accordionExample">
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseOne"
					aria-expanded="true" aria-controls="collapseOne">
					Home</button>
			</h2>
			<div id="collapseOne" class="accordion-collapse collapse show"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<form action="home.do">
						<button class="btn btn-primary">Home</button>
					</form>
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseTwo"
					aria-expanded="false" aria-controls="collapseTwo">
					View collection</button>
			</h2>
			<div id="collapseTwo" class="accordion-collapse collapse"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<form action="showCard.do">
						<button class="btn btn-primary">View the cards in the current collection</button>
					</form>
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseThree"
					aria-expanded="false" aria-controls="collapseThree">
					Update Your Info</button>
			</h2>
			<div id="collapseThree" class="accordion-collapse collapse"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<h3>Update Your Info</h3>
		<form action="updateUserAccount.do" method="post">


				<label for=firstName>Enter in your new first Name: </label>
				<br>
				 <input
					type="text" class="form-control" name="firstName"
					value="${loggedInUser.firstName }">

				<label for=lastName>Enter in your new last Name: </label>
				<br>
				 <input
					type="text" class="form-control" name="lastName"
					value="${loggedInUser.lastName }">


				<label for="username">Enter in the new username: </label>
				<br>
				 <input
					type="text" class="form-control" name="username"
					value="${loggedInUser.username }">
				<br> 
				<label
					for="password">Enter in the new password: </label> 
					<br>
					<input
					type="text" class="form-control" name="password"
					value="${loggedInUser.password }">
					<br> 
				<label
					for="pictureURL">Enter in the new pic: </label> 
					<br>
					<input
					type="text" class="form-control" name="pictureURL"
					value="${loggedInUser.pictureURL }">
					<br> 
					<label 
					for="description">Enter in new description: 
					</label>
					<br>
				<textarea rows="3" cols="50" name="description">${loggedInUser.description }</textarea>
				<br> <label for="street">Enter in the new Street: </label> <br><input
					type="text" name="street" value="${loggedInUser.address.street }"><br>
				<br> <label for="city">Enter in the new City: </label><br> <input
					type="text" name="city" value="${loggedInUser.address.city }">
					<br>
					<br>

				<label for="state">Enter in the new state: </label> 
				<br> 
				<input type="text" name="state" value="${loggedInUser.address.state }">
				<br>
				<br> 
				<label for="country">Enter in the new country: </label>
				<br> 
				<input
					type="text" name="country" value="${loggedInUser.address.country }"><br>
				<br>


				<button class="btn btn-primary">Update User Info</button>

		</form>
					<br>
		<form action="disbaleUser.do" method="post">
			<input type="hidden" name="userId" value="${loggedInUser.id }">
			<button class="btn btn-danger" >Deactivate</button>
		</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>