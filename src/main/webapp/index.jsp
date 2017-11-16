<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

</head>

<style>
.form-signin {
	max-width: 330px;
	padding: 15px;
	margin: 0 auto;
}

.form-signin .form-signin-heading, .form-signin .checkbox {
	margin-bottom: 10px;
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

	<div class="container">

		<form action="loginServlet" method="post" class="form-signin">

			<c:if test="${isRegistered}">
				<h5 class="form-signin-heading msg">Registered Successfully. Please Login</h5>
			</c:if>

			<h2 class="form-signin-heading">Please sign in</h2>
			<label for="inputEmail" class="sr-only">Email address</label> <input name="username" type="email" id="inputEmail"
				class="form-control text-field" placeholder="Email address" required="" autofocus=""> <label for="inputPassword" class="sr-only">Password</label>

			<input name="userpass" type="password" id="inputPassword" class="form-control text-field" placeholder="Password" required="">
			<button class="btn btn-lg btn-primary btn-block" type="submit">Signin</button>
			<a class="btn btn-lg btn-primary btn-block" href="register.jsp">Signup</a>

		</form>


	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
		integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
</body>
</html>