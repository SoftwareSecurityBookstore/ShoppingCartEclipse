<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");    
    String password = request.getParameter("password");
    Class.forName("org.sqlite.JDBC");
    Connection conn = DriverManager.getConnection("jdbc:sqlite:C:\\db\\bookstore.db"); 
    conn.setAutoCommit(false);
    Statement st = conn.createStatement();
    int i = st.executeUpdate("insert into members(Username, Password) values ('" + username + "','" + password + "' )");
    if (i > 0) {
        out.print("You have registered successfully!"+"<a href='login.jsp'> Go to Login</a>");
        conn.commit();
    } else {
        response.sendRedirect("index.jsp");
    }
    st.close();
    
    conn.close();
    
%>