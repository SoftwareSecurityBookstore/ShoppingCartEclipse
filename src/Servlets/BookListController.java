package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Objects.ShoppingCart;

@WebServlet(name = "BookListController", urlPatterns = {"/BookListController"})
public class BookListController extends HttpServlet {
	
	@Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		if (request.getAttribute("cart") != null) {
			ShoppingCart cart = (ShoppingCart) request.getAttribute("cSart");
		} else {
			ShoppingCart cart = new ShoppingCart();
		}
		switch(action) {
		case "Add":
			
			break;
		}
		
	}
}
