<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");    
    String password = request.getParameter("password");
    Class.forName("org.sqlite.JDBC");
    Connection conn = DriverManager.getConnection("jdbc:sqlite:C:\\db\\bookstore.db"); 
    conn.setAutoCommit(false);
    PreparedStatement pst = conn.prepareStatement("insert into members(Username, Password) values (?,?)");
    pst.setString(1, username);
    pst.setString(2, password);
    int i = pst.executeUpdate(); 
    if (i > 0) {
        out.print("You have registered successfully!"+"<a href='login.jsp'> Go to Login</a>");
        conn.commit();
    } else {
        response.sendRedirect("index.jsp");
    }
    pst.close();
    
    conn.close();
    
%>