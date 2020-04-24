<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<center>
		<h3>
			Admin <font color="#1cacf1">${userName}</font> Logged-In successfully
		</h3>
	</center>

	<div class="container">
		<div align="right">
		
		<input type="button" value="Home" onclick="window.location='/shiro/'" >
			<form method="post" action="logout">
				<button type="submit" class="btn btn-danger">Logout</button>
			</form>
		</div>
		
		<!--  <div></div> getServletContext().getRequestDispatcher("/yourJSP.jsp").forward(request, response); -->

		<!-- <form method="get" action="allUser">
			<button type="submit" class="btn btn-warning">Fetch all
				users!</button>
		</form> -->

		<div class="alert alert-success">
			<strong>${Msg}</strong>
		</div>

		<div>
			<table border="1" class="table table-striped table-bordered">
				<thead class="thead-light">
					<tr>
						<th>ID</th>
						<th>Full Name</th>
						<th>Phone</th>
						<th>Address</th>
						<th>Actions</th>
					</tr>
				</thead>
				<c:forEach items="${users}" var="e">
					<c:url var="updateLink" value="/update">
						<c:param name="id" value="${e.user_id}" />
					</c:url>

					<c:url var="deleteLink" value="/delete">
						<c:param name="id" value="${e.user_id}" />
					</c:url>
					<tbody>
						<tr>
							<td>${e.user_id}</td>
							<td>${e.user_name}</td>
							<td>${e.user_phone}</td>
							<td>${e.user_address}</td>
							<td><a href="${updateLink}">Update</a> | <a
								href="${deleteLink}"
								onclick="if(!(confirm('Are you sure want to delete Employee ***${e.user_name}*** with id #${e.user_id} permanently?'))) return false">Delete</a>
							</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>

	</div>


</body>





</html>
