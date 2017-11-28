<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*, java.util.concurrent.TimeUnit, java.util.Base64, java.security.*" %>    
    
<%
    String username = request.getParameter("username");   
    String password = request.getParameter("password");
    Class.forName("org.sqlite.JDBC");
    Connection conn = DriverManager.getConnection("jdbc:sqlite:C:\\db\\bookstore.db");          
    PreparedStatement pst = conn.prepareStatement("Select Username , Password from Members where Username=? and Password=?");
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
    ResultSet rs = pst.executeQuery();       
    if(rs.next()){
    	out.println("Welcome " + username);
    	boolean loggedIn = true;
    	//out.println("<a href='index.jsp> Go to book selection</a>");
    	session.setAttribute("loggedIn", new Boolean(loggedIn));
    	response.sendRedirect("index.jsp");  
    }     
    else{
       out.println("Invalid login credentials");  
       out.println("<a href='login.jsp'>Try again</a>");
    } 
    
    pst.close();
    conn.close();
   
     
%>