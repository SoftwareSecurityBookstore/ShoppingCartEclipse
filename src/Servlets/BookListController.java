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

@WebServlet(name = "BookListController", urlPatterns = {"/BookListController"})
public class BookListController extends HttpServlet {
	
	@Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		ShoppingCart cart;
		ArrayList<Book> books;
		if(request.getAttribute("bookList") != null) {
			books = (ArrayList<Book>) request.getAttribute("bookList");
		} else {
			books = new ArrayList<Book>();
		}
		if (request.getAttribute("cart") != null) {
			cart = (ShoppingCart) request.getAttribute("cSart");
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
