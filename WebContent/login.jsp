<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

<link rel="stylesheet" type="text/css" href="style.css" />

</head>
<body>
	<h1>Login</h1>
	<a href="index.jsp">Home</a>
	<form action="authenticate.jsp">
		<div class="container">
			<label><b>Username</b></label> 
			<input type="text" placeholder="Enter Username" name="username" required> 
			<label><b>Password</b></label>
			<input type="password" placeholder="Enter Password" name="password" required> 
			<input class="submit" type="submit" value = "Login"/>
		</div>
	</form>
		
	<a href="register.jsp">Register</a>


</body>
</html>