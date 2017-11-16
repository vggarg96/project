<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

<link href="http://code.gijgo.com/1.6.1/css/gijgo.css" rel="stylesheet" type="text/css" />

<style>
.top-margin {
	margin-top: 100px;
}

.text-field {
	margin-top: 10px;
	margin-bottom: 10px;
}

.msg {
	text-align: center;
	color: firebrick;
}
</style>

</head>
<body>

	<%
		//allow access only if session exists
		String user = null;
		if (session.getAttribute("user") == null) {
			//response.sendRedirect("index.jsp");
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
			
			if (userName != null)
				response.sendRedirect("home.jsp");
		}
	%>

	<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top"> <a class="navbar-brand" href="#">Railway</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	</nav>
	<div class="container top-margin">

		<c:if test="${isNotRegistered}">
			<h5 class="form-signin-heading msg">Sorry your account is not available please register.</h5>
		</c:if>

		<form action="registerServlet" method="post">
			<div class="row text-field justify-content-md-center">
				<div class="col-md-3">
					<h3 class="form-signup-heading">Sign up</h3>
				</div>

			</div>
			<div class="row text-field justify-content-md-center">
				<div class="col-md-3">
					<label for="emial" class="sr-only">Source</label> <input name="emailId" type="email" id="emailId" class="form-control text-field"
						placeholder="EMAIL" required="" autofocus="">
				</div>
			</div>
			<div class="row text-field justify-content-md-center">
				<div class="col-md-3">
					<label for="fname" class="sr-only">Source</label> <input name="fname" type="text" id="fname" class="form-control text-field"
						placeholder="First Name" required="" autofocus="">
				</div>
			</div>
			<div class="row text-field justify-content-md-center">
				<div class="col-md-3">
					<label for="lname" class="sr-only">Source</label> <input name="lname" type="text" id="lname" class="form-control text-field"
						placeholder="Last Name" required="" autofocus="">
				</div>
			</div>
			<div class="row text-field justify-content-md-center">
				<div class="col-md-3">
					<label for="pass" class="sr-only">Source</label> <input name="pass" type="password" id="pass" class="form-control text-field"
						placeholder="Password" required="" autofocus="">
				</div>
			</div>
			<div class="row text-field justify-content-md-center">
				<div class="col-md-3">
					<label for="age" class="sr-only">Source</label> <input name="age" type="number" id="age" class="form-control text-field" placeholder="AGE"
						required="" autofocus="">
				</div>
			</div>
			<div class="row text-field justify-content-md-center">
				<div class="col-md-3">
					<label class="radio-inline"> <input type="radio" name="gen" value="Male">Male
					</label> <label class="radio-inline"> <input type="radio" name="gen" value="Female">Female
					</label>

					<!-- <label for="gen" class="sr-only">Source</label> <input name="gen" type="gen" id="gen" class="form-control text-field" placeholder="GENDER"
						required="" autofocus=""> -->
				</div>
			</div>
			<div class="row text-field justify-content-md-center">
				<div class="col-md-3">
					<label for="mob" class="sr-only">Source</label> <input name="mob" type="number" id="mob" class="form-control text-field"
						placeholder="MOBILE" required="" autofocus="">
				</div>
			</div>
			<!-- <div class="row text-field justify-content-md-center">
				<div class="col-md-3">
					<label for="city" class="sr-only">Source</label> <input name="city" type="text" id="city" class="form-control text-field"
						placeholder="CITY" required="" autofocus="">
				</div>
			</div>
			<div class="row text-field justify-content-md-center">
				<div class="col-md-3">
					<label for="stat" class="sr-only">Source</label> <input name="stat" type="text" id="stat" class="form-control text-field"
						placeholder="STATE" required="" autofocus="">
				</div>
			</div> -->
			<div class="row text-field justify-content-md-center">
				<div class="col-md-3">
					<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
				</div>

			</div>
			<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
				integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
				integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
				integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
			<script src="http://code.gijgo.com/1.6.1/js/gijgo.js" type="text/javascript"></script>
</body>
</html>