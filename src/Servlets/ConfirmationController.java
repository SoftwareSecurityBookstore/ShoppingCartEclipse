package Servlets;

import java.io.IOException;
import java.sql.*;
import Objects.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Objects.ShoppingCart;

@WebServlet(name = "ConfirmationController", urlPatterns = {"/ConfirmationController"})
public class ConfirmationController extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
    	HttpSession session = request.getSession();
    	ShoppingCart cart = (ShoppingCart) request.getAttribute("cart");
    	
    	//update the books database and subtract the number of books purchased in this session.
    	try {
	    	Class.forName("org.sqlite.JDBC");
	        String path = getServletContext().getRealPath("bookstore.db");
	        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + path);          
	        Statement stat = conn.createStatement();   

	        for(int i = 0; i < cart.getNumItemsInCart(); i++) {
	        	Book b = cart.getBook(i);
	        	int amountPurchased = cart.getBookQuantity(i);
	        	int newAmount = b.getNewQuantity() - amountPurchased;
	        	stat.executeUpdate("update books set newQuantity = '" + newAmount + "' where isbn = '" + b.getIsbn() + "'");
	        }

	        conn.commit();
	        stat.close();
	        conn.close();
    	} catch(Exception e){
    		
    	}
    	
    	response.sendRedirect("bookList.jsp");
    }
}