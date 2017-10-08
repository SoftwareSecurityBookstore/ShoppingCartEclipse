
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kennesaw Bookstore</title>
    </head>
    <body>
    	<style>
    		a.link {
    			text-align:center;
    			display:block;
    		}
    		a.banner {
    			margin:auto;
    			align:left;
    		}
    	</style>
        <a href ="http://localhost:8080/BookstoreWebsite/index.jsp"><img src="image/images/ksu (1).png" width = "350" height = "100" alt = "Kennesaw Logo"></a>
        <%
        if( session.getAttribute("loggedIn") != null) {
        	Boolean loggedIn =  (Boolean) session.getAttribute("loggedIn");
        	
        	if(loggedIn.booleanValue()){
        		out.println("<a class='banner' href='shoppingCart.jsp'><img src='image/images/cart.png' alt='cart' width='80' height ='80'/></a>");
        		out.println("<a class='banner'href='logout.jsp'>Logout</a>");
        		out.println("</br>");
        		out.println("<h1 style='text-align:center'>Welcome to the Kennesaw Bookstore</h1></br>");
        		out.println("<a class='link' href='bookList.jsp'>Book List</a>");
        	}
        	else {
        		
        		out.println("<h1style='text-align:center'>Welcome to the Kennesaw Bookstore</h1></br>");
        		out.println("<h2style='text-align:center'>Please either login or register to begin using the bookstore<h2>");
        		out.println("<a style='text-align:center' href='login.jsp'>Login</a>");
        		out.println("</br>");
        		out.println("<a class='link' style='text-align:center' href='register.jsp'>Register</a>");
        		out.println("</br>");
        	}
        } 
        else {
        	out.println("</br>");
    		out.println("<h1 style='text-align:center'>Welcome to the Kennesaw Bookstore</h1></br>");
    		out.println("<h2 style='text-align:center'>Please either login or register to begin using the bookstore<h2>");
    		out.println("<a class='link' href='login.jsp'>Login</a>");
    		out.println("</br>");
    		out.println("<a class='link' href='register.jsp'>Register</a>");
    		out.println("</br>");
    		out.println("<a class='link' href='bookList.jsp'>Book List</a>");
        }%>
        
    </body>
</html>
