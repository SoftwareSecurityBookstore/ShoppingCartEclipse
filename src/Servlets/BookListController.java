package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Objects.ShoppingCart;
import Objects.Book;
import java.util.ArrayList;
import java.sql.*;

@WebServlet(name = "BookListController", urlPatterns = {"/BookListController"})
public class BookListController extends HttpServlet {
	
	@Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		ShoppingCart cart = new ShoppingCart();
		ArrayList<Book> books;
		if(session.getAttribute("bookList") != null) {
			books = (ArrayList<Book>) session.getAttribute("bookList");
		} else {
			books = new ArrayList<Book>();
			try {
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
			} catch(Exception e) {
				
			}
		}
		if (session.getAttribute("cart") != null) {
			cart = (ShoppingCart) session.getAttribute("cart");
		} else {
			cart = new ShoppingCart();
		}
		switch(action) {
		case "Add":
			String strIndex = request.getParameter("index");
			String strQty = request.getParameter("Qty");
			int intIndex = Integer.parseInt(strIndex);
			int intQty = Integer.parseInt(strQty);
			if(intQty > 0) {
				Book b = books.get(intIndex);
				cart.addToCart(b, intQty, 1);
				session.setAttribute("cart", cart);
				response.sendRedirect("bookList.jsp");
			} else {
				response.sendRedirect("bookList.jsp");
			}
			break;
		case "Checkout":
			response.sendRedirect("shoppingCart.jsp");
		}
		
	}
}
