package Servlets;

import java.io.IOException;

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
    	//todo: update the books database and subtract the number of books purchased in this session.
    	
    	response.sendRedirect("bookList.jsp");
    }
}