<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Books for Sale</title>
<%@page import="java.util.ArrayList, Objects.Book, java.sql.*" %>
</head>
<body>
	<%  int index = 0;
        int counter = 0;
        int bookType;
        long isbn;
        Book a;%>
	<%ArrayList<Book> books = new ArrayList<Book>();
	//convert DB books to objects and then add them to an Array %>
	
	<%
    Class.forName("org.sqlite.JDBC");
    String path = getServletContext().getRealPath("bookstore.db");
    Connection conn = DriverManager.getConnection("jdbc:sqlite:" + path);          
    Statement stat = conn.createStatement();    
    ResultSet rs = stat.executeQuery("select * from books;");
    
    while(rs.next()){
    	Book b = new Book();
    	b.setIsbn(rs.getInt("isbn"));
    	b.setBookName(rs.getString("bookName"));
    	String[] authors = new String[2];
    	authors[0] = rs.getString("author");
    	b.setAuthor(authors);
    	b.setNewQuantity(rs.getInt("newQuantity"));
    	b.setNewPrice(rs.getInt("newPrice"));
    	
    	books.add(b);
    }
    
    stat.close();
    conn.close();
		
	
	%>
	
	
	<%//iterate through the list of books and display each book
	//each book needs to have an add to cart button %>
	<table style ="margin: 0 auto;" border="1">
            <thead>

                <tr>
                    <th>Book Cover</th>
                    <th>Book Title</th>
                    <th>Author</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Add to Cart</th>
                </tr>
            </thead>
            <tbody>
            	<% for (int i = 0; i < books.size(); i++) {
                    a = books.get(i);
                    isbn = a.getIsbn();
                    out.println("<tr>");
                    out.println("<td><img src='image/images/" + isbn + ".jpg' width = '175' height = '275' </td>");
                    out.println("<td>" + a.getBookName() + "</td>");
                    out.println("<td>" + a.getAuthor()[0] + "</td>");
                    out.println("<td>" + a.getNewQuantity() + "</td>");
                    out.println("<td>" + a.getNewPrice() + "</td>");%>
                    <td><form method='POST' action='${pageContext.request.contextPath}/bookListController'><input style="width: 50px;" type='number' name='Qty' value=''/><input style='display:none;' type='text' name='index' value='<%out.print(counter); %>' size='1' /><input type='submit' name='action' value='Add' /></form>Max Qty: <%out.print(a.getNewQuantity());%> </td>
            	<%}
            	%>
            </tbody>
     </table>
</body>
</html>