<%-- 
    Document   : bookDetails
    Created on : Apr 19, 2017, 8:34:43 PM
    Author     : Adam Hayes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <%@page import = "java.io.*, java.util.*, Objects.Book, Objects.ShoppingCart" %>
        <%ShoppingCart cart = new ShoppingCart(); %>
        <%String isbn;
        String[] authors = new String[2];
        authors[0] = "James Earl"; 
        authors[1] = "Jimmy Hendrix";
        isbn = "978-0073376356";
        Book test1 = new Book();
        test1.setIsbnForCovers(isbn);
        test1.setBookName("Chemistry A Modern Approach");
        test1.setAuthor(authors);
        test1.setSemester("Fall");
        test1.setCourse("SWE 3313");
        test1.setSection(61);
        test1.setProfessor("Lartigue");
        test1.setCrn(22456);
        test1.setNewQuantity(30);
        test1.setUsedQuantity(10);
        test1.setRentalQuantity(20);
        test1.setEbookQuantity(999999);
        test1.setNewPrice(123.12);
        test1.setUsedPrice(70.31);
        test1.setRentalPrice(55.31);
        test1.setEbookPrice(67.93);
        test1.setDescription("This is a textbook for Chemistry! Apparently also SWE 3313 lol"); %>
        <% cart.addToCart(test1, 3, 1);
        cart.addToCart(test1, 1, 4); %>
        <% session.setAttribute("cart", cart); %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
    </head>
    <body>
        <a href ="http://localhost:8080/BookstoreWebsite/shoppingCart.jsp"><img src="image/images/ksu (1).png" width = "300" height = "100" alt = "Kennesaw Logo"></a>
    </body>
</html>