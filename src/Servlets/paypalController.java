package Servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Bookstore on 4/29/2017.
 */

@WebServlet(name = "paypalController", urlPatterns = {"/paypalController"})
public class paypalController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String strAction = request.getParameter("submitPaypal");
        if (strAction != null && !strAction.equals("")) {
            String paypalEmail = request.getParameter("paypalEmail");
            String paypalPassword = request.getParameter("paypalPassword");
            if (paypalPassword.length() >= 8 && !paypalEmail.equals("")) {
                response.sendRedirect("http://localhost:8080/OrderConfirmation.jsp"); //sends the user to the confirmation page
                return;
            } else {
                response.sendRedirect("http://localhost:8080/paypal.jsp"); //sends the user back to the paypal page for information re-entry
                return;
            }
        }
        response.sendRedirect("http://localhost:8080/paypal.jsp"); //sends the user back to the paypal page for information re-entry
        return;
    }
}

