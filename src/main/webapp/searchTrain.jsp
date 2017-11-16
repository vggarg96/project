<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Trains</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

<link href="http://code.gijgo.com/1.6.1/css/gijgo.css" rel="stylesheet" type="text/css" />

<style>
.top-margin {
	margin-top: 100px;
}

.left-margin {
	margin-left: 450px;
}

.text-field {
	margin-top: 10px;
	margin-bottom: 10px;
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
			<li class="nav-item"><a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Check PNR Status</a></li>
			<li class="nav-item active"><a class="nav-link" href="searchTrain.jsp">Search Trains</a></li>
			<li class="nav-item active left-margin"><a class="nav-link" href="searchTrain.jsp">Hi <%=user%>,
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="logoutServlet">Log Out</a></li>
		</ul>
	</div>
	</nav>
	<div class="container top-margin">

		<form action="trainServlet" method="get">
			<div class="row text-field justify-content-md-center">
				<div class="col-md-3">
					<h3 class="form-signin-heading">Search Trains</h3>
				</div>

			</div>
			<div class="row text-field justify-content-md-center">
				<div class="col-md-3">
					<label for="src" class="sr-only">Source</label> <input name="src" type="src" id="src" class="form-control text-field" placeholder="Source"
						required="" autofocus="">
				</div>

			</div>
			<div class="row text-field justify-content-md-center">
				<div class="col-md-3">
					<label for="dst" class="sr-only">Destination</label> <input name="dst" type="dst" id="dst" class="form-control text-field"
						placeholder="Destination" required="">
				</div>

			</div>

			<div class="row text-field justify-content-md-center">
				<div class="col-md-3">
					<label for="datepicker" class="sr-only">Select Date</label> <input name="onDate" id="datepicker" />
				</div>

			</div>

			<div class="row text-field justify-content-md-center">
				<div class="col-md-3">
					<button class="btn btn-lg btn-primary btn-block" type="submit">Search Trains</button>
				</div>

			</div>

		</form>


	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
		integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
	<script src="http://code.gijgo.com/1.6.1/js/gijgo.js" type="text/javascript"></script>

	<script>
		var today, datepicker;
		today = new Date(new Date().getFullYear(), new Date().getMonth(),
				new Date().getDate());

		$('#datepicker').datepicker(
				{
					uiLibrary : 'bootstrap4',
					iconsLibrary : 'fontawesome',
					format : 'yyyy-mm-dd',
					//minDate : today,
					maxDate : function() {
						var date = new Date();
						date.setDate(date.getDate() + 90);
						return new Date(date.getFullYear(), date.getMonth(),
								date.getDate());
					}
				});
	</script>
</body>
</html>