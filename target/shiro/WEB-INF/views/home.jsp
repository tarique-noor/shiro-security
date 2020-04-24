<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<body>
	<h1>You have logged in ${userName}.</h1>

	<form method="post" action="logout">
		<button type="submit" class="btn btn-danger">Logout</button>
	</form>


	<form method="post" action="allUser">
		<button type="submit" class="btn btn-warning">ONLY ADMIN:
			Fetch all users!</button>
	</form>

	<form method="get" action="oneUser">
		<input type="text" class="form-control" id="id" name="id"
			placeholder="User ID">
		<button type="submit" class="btn btn-primary">ANYONE: Fetch
			single user!</button>
	</form>

	<div class="alert alert-success">
		<strong>${errorMsg}</strong>
	</div>

	<div class="alert alert-warning">
		${user}
		<c:forEach items="${users}" var="element">
			<tr>
				<td>${element}</td>
			</tr>
		</c:forEach>
	</div>


</body>
</html>
