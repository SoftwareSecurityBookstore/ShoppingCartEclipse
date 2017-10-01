/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Objects.ShoppingCart;
import Objects.Book;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Adam Hayes
 */
@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {     
        //will check to see if the update function has been called
        HttpSession session = request.getSession(); //sets up session for getting the cart
        ShoppingCart cart = new ShoppingCart();
        if(session.getAttribute("cart") != null) {
            cart = (ShoppingCart)session.getAttribute("cart");
        }
        String strAction = request.getParameter("action");

        if(strAction != null && !strAction.equals("")) {
            if (strAction.equals("Update")) {
                String indexStr = request.getParameter("index");
                int indexInt = Integer.parseInt(indexStr); //turn the index into an int so it is compatible with the cart
                String newQtyStr = request.getParameter("newQty"); //string for the newQuantity request
                int newQtyInt = Integer.parseInt(newQtyStr);

                Book a;
                a = cart.getBook(indexInt);
                String isbn = a.getIsbnForCovers();
                int bookType = cart.getBookType(indexInt);
                if(newQtyInt != 0) {
                    cart.updateCart(isbn, newQtyInt, bookType); //updates the books in the cart at the index specified
                    session.setAttribute("cart", cart); //posts the new cart to the session
                    response.sendRedirect("http://localhost:8080/BookstoreWebsite/shoppingCart.jsp"); //reloads the Shopping Cart page
                    return;
                } else {
                    cart.removeFromCart(isbn, bookType);
                    session.setAttribute("cart", cart); //posts the new cart to the session
                    response.sendRedirect("http://localhost:8080/BookstoreWebsite/shoppingCart.jsp"); //reloads the Shopping Cart page
                    return;
                }
            } else if (strAction.equals("Continue Shopping")) {
                response.sendRedirect("http://localhost:8080/BookstoreWebsite/bookList.jsp"); //sends user back to the home page to continue searching for books
                return;
            } else if (strAction.equals("Checkout")) {
                response.sendRedirect("http://localhost:8080/BookstoreWebsite/OrderInformation.jsp"); //sends the user to the checkout page to complete their purchase
                return;
            }
        }
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
