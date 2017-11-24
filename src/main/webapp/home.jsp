<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

<style type="text/css">
.top-margin {
	margin-top: 100px;
}

.left-margin {
	margin-left: 450px;
}
</style>

</head>
<body>

	<%
		//allow access only if session exists
		String user = null;
		if (session.getAttribute("user") == null) {
			response.sendRedirect("index.jsp");
		} else {
			user = (String) session.getAttribute("user");

			String userName = null;
			String sessionID = null;
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("user"))
						userName = cookie.getValue();
					if (cookie.getName().equals("JSESSIONID"))
						sessionID = cookie.getValue();
				}
			}

			if (userName == null)
				response.sendRedirect("index.jsp");
		}
	%>

	<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top"> <a class="navbar-brand" href="home.jsp">Railway</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarsExampleDefault">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Check PNR Status</a></li>
			<li class="nav-item"><a class="nav-link" href="searchTrain.jsp">Search Trains</a></li>
			<li class="nav-item active left-margin"><a class="nav-link" href="searchTrain.jsp">Hi <%=user%>,
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="logoutServlet">Log Out</a></li>
		</ul>

	</div>
	</nav>


	<div class="container top-margin">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<h3>User</h3>
					<th scope="col">Field</th>
					<th scope="col">Type</th>
					<th scope="col">Null</th>
					<th scope="col">key</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>Email</th>
					<th>varchar(40)</th>
					<td>NO</td>
					<td>PRIMARY</td>
				</tr>
				<tr>
					<th>fname</th>
					<th>varchar(30)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>lname</th>
					<th>varchar(30)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>password</th>
					<th>varchar(30)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>age</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>gender</th>
					<th>varchar(2)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>mobile</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>

			</tbody>
		</table>

		<table class="table">
			<thead class="thead-dark">
				<tr>
					<h3>Passenger</h3>
					<th scope="col">Field</th>
					<th scope="col">Type</th>
					<th scope="col">Null</th>
					<th scope="col">key</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>Pnr</th>
					<th>int(11)</th>
					<td>NO</td>
					<td>PRIMARY</td>
				</tr>
				<tr>
					<th>train_id</th>
					<th>int(11)</th>
					<td>YES</td>
					<td>MUL</td>
				</tr>
				<tr>
					<th>full_name</th>
					<th>varchar(20)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>gender</th>
					<th>varchar(2)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>age</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>Seat NO</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>class</th>
					<th>varchar(10)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>fair</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>Scr ID</th>
					<th>varchar(10)</th>
					<td>YES</td>
					<td>MUL</td>
				</tr>
				<tr>
					<th>Dest ID</th>
					<th>varchar(10)</th>
					<td>YES</td>
					<td>MUL</td>
				</tr>


			</tbody>
		</table>

		<table class="table">
			<thead class="thead-dark">
				<tr>
					<h3>Reservation</h3>
					<th scope="col">Field</th>
					<th scope="col">Type</th>
					<th scope="col">Null</th>
					<th scope="col">key</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>Email id</th>
					<th>varchar(30)</th>
					<td>NO</td>
					<td>PRIMARY</td>
				</tr>
				<tr>
					<th>pnr</th>
					<th>int(11)</th>
					<td>NO</td>
					<td>PRIMARY</td>
				</tr>
				<tr>
					<th>train id</th>
					<th>int(11)</th>
					<td>NO</td>
					<td>PRIMARY</td>
				</tr>
				<tr>
					<th>train name</th>
					<th>varchar(30)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>res-status</th>
					<th>varchar(20)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>res-date</th>
					<th>date</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>Scr name</th>
					<th>varchar(30)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>Dest name</th>
					<th>varchar(30)</th>
					<td>YES</td>
					<td></td>
				</tr>


			</tbody>
		</table>

		<table class="table">
			<thead class="thead-dark">
				<tr>
					<h3>Route</h3>
					<th scope="col">Field</th>
					<th scope="col">Type</th>
					<th scope="col">Null</th>
					<th scope="col">key</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>train id</th>
					<th>int(11)</th>
					<td>NO</td>
					<td>PRIMARY</td>
				</tr>
				<tr>
					<th>total stop</th>
					<th>int(11)</th>
					<td>NO</td>
					<td>PRIMARY</td>
				</tr>
				<tr>
					<th>scr-distance</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>dest_arriv_time</th>
					<th>time</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>scr_depart_time</th>
					<th>time</th>
					<td>YES</td>
					<td></td>
				</tr>

			</tbody>
		</table>

		<table class="table">
			<thead class="thead-dark">
				<tr>
					<h3>Station</h3>
					<th scope="col">Field</th>
					<th scope="col">Type</th>
					<th scope="col">Null</th>
					<th scope="col">key</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>station id</th>
					<th>int(11)</th>
					<td>NO</td>
					<td>PRIMARY</td>
				</tr>
				<tr>
					<th>station name</th>
					<th>varchar(30)</th>
					<td>YES</td>
					<td></td>
				</tr>

			</tbody>
		</table>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<h3>train</h3>
					<th scope="col">Field</th>
					<th scope="col">Type</th>
					<th scope="col">Null</th>
					<th scope="col">key</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>train id</th>
					<th>int(11)</th>
					<td>NO</td>
					<td>PRIMARY</td>
				</tr>
				<tr>
					<th>train name</th>
					<th>varchar(30)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>train type</th>
					<th>varchar(30)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>availability</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>days</th>
					<th>varchar(15)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>dest_arriv_time</th>
					<th>time</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>scr_depart_time</th>
					<th>time</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>total_time</th>
					<th>time</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>Scr id</th>
					<th>int(11)</th>
					<td>Yes</td>
					<td>MUL</td>
				</tr>
				<tr>
					<th>Dest id</th>
					<th>int(11)</th>
					<td>YES</td>
					<td>MUL</td>
				</tr>


			</tbody>
		</table>

		<table class="table">
			<thead class="thead-dark">
				<tr>
					<h3>train availanility</h3>
					<th scope="col">Field</th>
					<th scope="col">Type</th>
					<th scope="col">Null</th>
					<th scope="col">key</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>id</th>
					<th>int(11)</th>
					<td>NO</td>
					<td>PRIMARY</td>
				</tr>
				<tr>
					<th>train id</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>seat_class_1</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>seat_class_2</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>seat_class_3</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>seat_sleeper</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>seat_general</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>

				<tr>
					<th>wait_seat_class1</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>wait_seat_class2</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>wait_seat_class3</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>wait_seat_sleeper</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>avail_seat_class1</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>avail_seat_class2</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>

				<tr>
					<th>avail_seat_class3</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>

				<tr>
					<th>avail_seat_sleeper</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>

				</tr>
				<tr>
					<th>fare_class1</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>fare_class2</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>fare_class3</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>fare_sleeper</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>fare_general</th>
					<th>int(11)</th>
					<td>YES</td>
					<td></td>
				</tr>
				<tr>
					<th>ondate</th>
					<th>date</th>
					<td>YES</td>
					<td></td>
				</tr>
			</tbody>
		</table>

	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
		integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
</body>
</html>