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
 * Created by Adam Hayes on 4/23/2017.
 */
@WebServlet(name = "OrderInfoController", urlPatterns = {"/OrderInfoController"})
public class OrderInfoController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String strAction = request.getParameter("orderInfoSubmit");
        OrderInfoHandler orderInfo = new OrderInfoHandler();

        if(strAction != null && !strAction.equals("")) {
            String shippingName = request.getParameter("shippingName");
            String shippingAddress1 = request.getParameter("shippingAddress");
            String shippingAddress2 = request.getParameter("shippingAddressLine2");
            String shippingCity = request.getParameter("shippingCity");
            String shippingState = request.getParameter("shippingState");
            String strShippingZip = request.getParameter("shippingZip");
            String billingName = request.getParameter("billingName");
            String billingAddress1 = request.getParameter("billingAddress");
            String billingAddress2 = request.getParameter("billingAddressLine2");
            String billingCity = request.getParameter("billingCity");
            String billingState = request.getParameter("billingState");
            String strBillingZip = request.getParameter("billingZip");
            String email = request.getParameter("email");
            String shippingAsBilling = "";
            if (request.getParameter("shippingAsBilling") != null) {shippingAsBilling = request.getParameter("shippingAsBilling"); }
            int intBillingZip = 0;
            if (!strBillingZip.equals("")) {intBillingZip = Integer.parseInt(strBillingZip); }
            int intShippingZip = 0;
            if (!strShippingZip.equals("")) {intShippingZip = Integer.parseInt(strShippingZip); }
            if (!shippingName.equals("") && !shippingAddress1.equals("") && !shippingCity.equals("") && !shippingState.equals("") && !strShippingZip.equals("") && !email.equals("")) {
                if (shippingAsBilling.equals("yes")) {
                    if(orderInfo.validZip(intShippingZip)) {
                        orderInfo.setShippingName(shippingName);
                        orderInfo.setShippingAddress(shippingAddress1);
                        orderInfo.setShippingAddressLine2(shippingAddress2);
                        orderInfo.setShippingCity(shippingCity);
                        orderInfo.setShippingState(shippingState);
                        orderInfo.setShippingZip(intShippingZip);
                        orderInfo.setEmailAddress(email);
                        orderInfo.shippingAsBilling();
                    } else {
                        session.setAttribute("orderInfo", orderInfo); //posts the new orderInfo to the session
                        response.sendRedirect("http://localhost:8080/OrderInformation.jsp"); //sends the user to the paymentInfo page
                        return;
                    }
                } else {
                    if (!billingName.equals("") && !billingAddress1.equals("") && !billingCity.equals("") && !billingState.equals("") && !strBillingZip.equals("")&& !email.equals("")) {
                        if (orderInfo.validZip(intBillingZip)) {
                            orderInfo.setShippingName(shippingName);
                            orderInfo.setShippingAddress(shippingAddress1);
                            orderInfo.setShippingAddressLine2(shippingAddress2);
                            orderInfo.setShippingCity(shippingCity);
                            orderInfo.setShippingState(shippingState);
                            orderInfo.setShippingZip(intShippingZip);
                            orderInfo.setBillingName(billingName);
                            orderInfo.setBillingAddress(billingAddress1);
                            orderInfo.setBillingAddressLine2(billingAddress2);
                            orderInfo.setBillingCity(billingCity);
                            orderInfo.setBillingState(billingState);
                            orderInfo.setBillingZip(intBillingZip);
                            orderInfo.setEmailAddress(email);
                        } else {
                            session.setAttribute("orderInfo", orderInfo); //posts the new orderInfo to the session
                            response.sendRedirect("http://localhost:8080/OrderInformation.jsp"); //sends the user to the paymentInfo page
                            return;
                        }
                    }
                }
                session.setAttribute("orderInfo", orderInfo); //posts the new orderInfo to the session
                response.sendRedirect("http://localhost:8080/paymentInfo.jsp"); //sends the user to the paymentInfo page
                return;
            }
            session.setAttribute("orderInfo", orderInfo); //posts the new orderInfo to the session
            response.sendRedirect("http://localhost:8080/OrderInformation.jsp"); //sends the user to the paymentInfo page
            return;
        }
        session.setAttribute("orderInfo", orderInfo); //posts the new orderInfo to the session
        response.sendRedirect("http://localhost:8080/paymentInfo.jsp"); //goes to the payment Information Screen
        return;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
