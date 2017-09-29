<%@ page import="Objects.OrderInfoHandler" %><%--
  Created by IntelliJ IDEA.
  User: Bookstore
  Date: 4/26/2017
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<% OrderInfoHandler orderInfo = new OrderInfoHandler();
    orderInfo = (OrderInfoHandler)session.getAttribute("orderInfo");
%>
<head>
    <title>Payment Information</title>
</head>
<body>
<h1>Shipping Info: </h1>
<%
    out.println("<br>" + orderInfo.getShippingName() + "<br>");
    out.println(orderInfo.getShippingAddress() + "<br>");
    out.println(orderInfo.getShippingAddressLine2() + "<br>");
    out.println(orderInfo.getShippingCity() + "<br>");
    out.println(orderInfo.getShippingState() + "<br>");
    out.println(orderInfo.getShippingZip() + "<br>");
%>

<h1> Billing Info: </h1>
<%
    out.println("<br>" +orderInfo.getBillingName() + "<br>");
    out.println(orderInfo.getBillingAddress() + "<br>");
    out.println(orderInfo.getBillingAddressLine2() + "<br>");
    out.println(orderInfo.getBillingCity() + "<br>");
    out.println(orderInfo.getBillingState() + "<br>");
    out.println(orderInfo.getBillingZip() + "<br>");
    out.println("Email Address: " + orderInfo.getEmailAddress() + "<br>");
%>
</body>
</html>
