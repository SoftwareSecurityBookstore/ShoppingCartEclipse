<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

 <link rel = "stylesheet"
   type = "text/css"
   href = "style.css" />
   
<title>Register</title>
</head>
<body>
	<h1>Register</h1>
	<form action="processReg.jsp">		
	  <div class="container">
	    <label><b>Username</b></label>
	    <input type="text" placeholder="Enter Username" name="username" required>
	
	    <label><b>Password</b></label>
	    <input type="password" placeholder="Enter Password" name="password" required>
	
	    <button type="submit">Register</button>
	    
	  </div>
	<a href="login.jsp">Login</a>
</body>
</html>