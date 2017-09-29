<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*" %>    
    
<%
    String username = request.getParameter("username");   
    String password = request.getParameter("password");
    Class.forName("org.sqlite.JDBC");
    String path = getServletContext().getRealPath("bookstore.db");
    Connection conn = DriverManager.getConnection("jdbc:sqlite:" + path);          
    PreparedStatement pst = conn.prepareStatement("Select Username , Password from Members where Username=? and Password=?");
    pst.setString(1, username);
    pst.setString(2, password);
    ResultSet rs = pst.executeQuery();       
    if(rs.next()){
    	out.println("Welcome " + username);
    	response.sendRedirect("index.jsp");  
    }     
    else{
       out.println("Invalid login credentials");  
       out.println("<a href='login.jsp'>Try again</a>");
    } 
    
    pst.close();
    conn.close();
   
     
%>