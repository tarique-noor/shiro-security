<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
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

<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
body {
	font-family: Arial;
}

/* Style the tab */
.tab {
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
}
</style>
</head>

<style>
.btn {
	background-color: white;
	border: 2px solid black;
	color: green;
	padding: 5px 10px;
	text-align: center;
	display: inline-block;
	font-size: 20px;
	margin: 10px 30px;
	cursor: pointer;
}
</style>


</script>

<body>
	<center>
		<h3>
			You have logged in <font color="#1cacf1">${userName}</font>
		</h3>
	</center>

	<div class="container">
		<div align="right">
			<form method="post" action="logout">
				<button type="submit" class="btn btn-danger">Logout</button>
			</form>
		</div>

		<!-- <form method="get" action="allUser">
			<button type="submit" class="btn btn-warning">Fetch all
				users!</button>
		</form> -->


	<div class="tab">

		<shiro:hasAnyRoles name="admin,user">
			<button class="tablinks" onclick="openTabs(event, 'Display')"
				id="defaultOpen">Display</button>
		</shiro:hasAnyRoles>
		
		<shiro:hasAnyRoles name="admin">
			<button class="tablinks" onclick="openTabs(event, 'Admin')">Admin</button>
		</shiro:hasAnyRoles>
		
		<shiro:hasAnyRoles name="admin">
			<button class="tablinks" onclick="openTabs(event, 'Register')">NormalRegistration</button>
		</shiro:hasAnyRoles>

		<shiro:hasAnyRoles name="user">
			<button class="tablinks" onclick="openTabs(event, 'User')">User</button>
		</shiro:hasAnyRoles>
		
		<shiro:hasAnyRoles name="admin">
			<button class="tablinks" onclick="openTabs(event, 'newLogin')">Create User for Login</button>
		</shiro:hasAnyRoles>

	</div>

	<div id="Display" class="tabcontent">
		<h3>Home</h3>
		<div class="alert alert-success">
			<strong>${Msg}</strong>
		</div>
	</div>

	<div id="newLogin" class="tabcontent">
		
			<form method="get" action="newRegister">
			<button type="submit" class="btn btn-normal">Create User For Login</button>
		</form>
	
	</div>
	
	<div id="Admin" class="tabcontent">
		<h3>Admin</h3>
		<form method="get" action="allUser">
			<button type="submit" class="btn btn-warning">Fetch all
				users!</button>
		</form>
	</div>
	
	<div id="Register" class="tabcontent">
		<form method="get" action="register">
			<button type="submit" class="btn btn-warning">Normal Register</button>
		</form>
	</div>

	<div id="User" class="tabcontent">
	
	<form method="get" action="allUser">
		<button type="submit" class="btn btn-normal">Fetch Data of users!</button>
	</form>
		<div>
			<table border="1" class="table table-striped table-bordered">
				<thead class="thead-light">
					<tr>
						<th>ID</th>
						<th>Full Name</th>
						<th>Phone</th>
						<th>Address</th>
					</tr>
				</thead>
				<c:forEach items="${users}" var="e">
					<tbody>
						<tr>
							<td>${e.user_id}</td>
							<td>${e.user_name}</td>
							<td>${e.user_phone}</td>
							<td>${e.user_address}</td>
							
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
		
	</div>



</div>

</body>

<script>
	function openTabs(evt, cityName) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}
		document.getElementById(cityName).style.display = "block";
		evt.currentTarget.className += " active";
	}

	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();
</script>

</html>
