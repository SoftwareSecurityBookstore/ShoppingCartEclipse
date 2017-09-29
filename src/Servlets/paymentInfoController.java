package Servlets;

import Objects.OrderInfoHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Bookstore on 4/27/2017.
 */

@WebServlet(name = "paymentInfoController", urlPatterns = {"/paymentInfoController"})
public class paymentInfoController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String strAction = request.getParameter("paymentOptionSubmit");
        OrderInfoHandler orderInfo = (OrderInfoHandler)session.getAttribute("orderInfo");
        String paymentSelection = request.getParameter("paymentSelect");
        if(strAction != null && !strAction.equals("")) {
            if(paymentSelection.equals("creditCard")) {
                String strCreditNum = request.getParameter("cardNumber");
                long longCreditNum = Long.parseLong(strCreditNum);
                long creditNumLength = (long)(Math.log10(longCreditNum) + 1);
                String cardName = request.getParameter("nameOnCard");
                String cardMonth = request.getParameter("month");
                String cardYear = request.getParameter("year");
                int intCardYear = Integer.parseInt(cardYear);
                String cardCvv = request.getParameter("cvv");
                int intCardCvv = Integer.parseInt(cardCvv);
                if(creditNumLength != 16 || intCardYear < 2017 || intCardCvv != 777) {
                    response.sendRedirect("http://localhost:8080/BookstoreWebsite/paymentInfo.jsp"); //sends the user to the paymentInfo page
                    return;
                } else {
                    orderInfo.setPaymentChoice("Credit Card");
                    session.setAttribute("orderInfo", orderInfo);
                    response.sendRedirect("http://localhost:8080/BookstoreWebsite/OrderConfirmation.jsp");
                    return;
                }
            } else if (paymentSelection.equals("paypal")) {
                orderInfo.setPaymentChoice("Paypal");
                session.setAttribute("orderInfo", orderInfo);
                response.sendRedirect("http://localhost:8080/BookstoreWebsite/paypal.jsp"); //sends the user to the paypal page
                return;
            } else {
                orderInfo.setPaymentChoice("Financial Aid");
                session.setAttribute("orderInfo", orderInfo);
                response.sendRedirect("http://localhost:8080/BookstoreWebsite/Login.jsp"); //sends the user to the financial aid login page
            }
        }

    }
}
