
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kennesaw Bookstore</title>
    </head>
    <body>
        <a href ="http://localhost:8080/BookstoreWebsite/index.jsp"><img src="image/images/ksu (1).png" width = "350" height = "100" alt = "Kennesaw Logo"></a>
        <%
        if( session.getAttribute("loggedIn") != null) {
        	Boolean loggedIn =  (Boolean) session.getAttribute("loggedIn");
        	
        	if(loggedIn.booleanValue()){
        		out.println("<a href='logout.jsp'>Logout</a>");
        		out.println("<a href='shoppingCart.jsp'><img src='image/images/cart.png' alt='cart' width='80' height ='80'/></a>");
        		out.println("</br>");
        		out.println("<a href='bookList.jsp'>Book List</a>");
        		//display logged in information
        	}
        	else {        		
        		out.println("<h1>Welcome to the Kennesaw Bookstore</h1></br>");
        		out.println("<h2>Please either login or register to begin using the bookstore<h2>");
        		out.println("<a href='login.jsp'>Login</a>");
        		out.println("</br>");
        		out.println("<a href='register.jsp'>Register</a>");
        		
        	}
        } 
        else {
        	out.println("</br>");
    		out.println("<h1>Welcome to the Kennesaw Bookstore</h1></br>");
    		out.println("<h2>Please either login or register to begin using the bookstore<h2>");
    		out.println("<a href='login.jsp'>Login</a>");
    		out.println("</br>");
    		out.println("<a href='register.jsp'>Register</a>");
    		
        }%>
        
    </body>
</html>
