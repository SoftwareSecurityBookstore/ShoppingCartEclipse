<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*, java.util.Base64, java.security.*" %>
<%
    String username = request.getParameter("username");    
    String password = request.getParameter("password");
    Class.forName("org.sqlite.JDBC");
    Connection conn = DriverManager.getConnection("jdbc:sqlite:C:\\db\\bookstore.db"); 
    conn.setAutoCommit(false);
    PreparedStatement pst = conn.prepareStatement("insert into members(Username, Password) values (?,?)");
    pst.setString(1, username);
          
    //simple encryption
    byte[] encryptArr = Base64.getEncoder().encode(password.getBytes());        
    String encpass = new String(encryptArr,"UTF-8");   
    
    MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
    mdAlgorithm.update(encpass.getBytes());

    byte[] digest = mdAlgorithm.digest();
    StringBuffer hexString = new StringBuffer();

    for (int i = 0; i < digest.length; i++) {
    	encpass = Integer.toHexString(0xFF & digest[i]);
        if (encpass.length() < 2) {
        	encpass = "0" + encpass;
        }

        hexString.append(encpass);
    }
    
    pst.setString(2, hexString.toString());
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