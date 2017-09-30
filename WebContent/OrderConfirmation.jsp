<%@ page import="Objects.ShoppingCart" %>
<%@ page import="Objects.Book" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="Objects.OrderInfoHandler" %>
<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ShoppingCart cart;
        try {
            cart = (ShoppingCart) session.getAttribute("cart");
            }
        catch (NullPointerException ex)
        {
            out.println("The shopping cart is empty");
            cart = new ShoppingCart();
        }
%>
<html>
<head>
    <title>Order Confirmation</title>
</head>
<body>
<a href ="http://localhost:8080/index.jsp"><img src="image/images/ksu (1).png" width = "350" height = "100" alt = "Kennesaw Logo"></a>
<a href="shoppingCart.jsp"><img src="image/images/cart.png" alt="cart" width="80" height ="80"/></a>
</br>
<table class="CartInfo" align="center">
    <div class="Title"><thead><b>Items Ordered:</b></thead></div>
    <tr>
        <th>Book Cover</th>
        <th>Book Title</th>
        <th>Book Type</th>
        <th>Total Price</th>
        <th>Quantity</th>

    </tr>

    <%
        for (int i = 0; i < cart.size(); i++) {
            Book book = cart.getBook(i);
        %>
    <tr>
        <td>
            <img src="image/images/<%=book.getIsbnForCovers()%>.jpg" width = "170" height = "275">
        </td>
        <td>
            <%out.println(book.getBookName());%>
        </td>
        <td>
            <%switch (cart.getBookType(i))
            {
                case 1:
                    out.println("New");
                    break;
                case 2:
                    out.println("Used");
                    break;
                case 3:
                    out.println("Rental");
                    break;
                case 4:
                    out.println("Ebook");
                    break;
            }%>
        </td>
        <td>
            <%
                switch (cart.getBookType(i))
                {
                    case 1:
                        out.println("$" + cart.getBookQuantity(i) * book.getNewPrice());
                        break;
                    case 2:
                        out.println("$" + cart.getBookQuantity(i) * book.getUsedPrice());
                        break;
                    case 3:
                        out.println("$" + cart.getBookQuantity(i) * book.getRentalPrice());
                        break;
                    case 4:
                        out.println("$" + cart.getBookQuantity(i) * book.getEbookPrice());
                        break;
                }
            %>
        </td>
        <td>
            <%out.println(cart.getBookQuantity(i));%>
        </td>
    </tr>

    <%
        }
    %>
    <style>
        table.CartInfo tr, td, th{
            border: 1px solid black;
            border-collapse: collapse;
        }
        td, th {
            padding: 5px;
            text-align: left;
        }
    </style>
</table>
<table class="PriceInfo" align="center">
    <tr>
        <td>
            <b>Subtotal:</b> $<%=cart.getSubtotal()%>
        </td>
    </tr>
    <tr>
        <td>
            <b>Shipping:</b> $<%=new DecimalFormat("#.00").format(cart.getShipping())%>
        </td>
    </tr>
    <tr>
        <td>
            <b>Tax:</b> $<%=cart.getCalcTax()%>
        </td>
    </tr>
    <tr>
        <td>
            <b>Total:</b> $<%=cart.getTotalPrice()%>
        </td>
    </tr>
</table>
<div class="CheckoutForms">
    <form name="updateCart" action="shoppingCart.jsp" method="get">
        <input type="submit" name="updateCart" value="Edit Cart" align="center">
    </form>
    <%
        OrderInfoHandler order;
        try {
            order = (OrderInfoHandler) session.getAttribute("orderInfo");
        }
        catch (NullPointerException ex)
        {
            order = new OrderInfoHandler();
        }
    %>
    <table class="ShippingInfo" align="center">
        <th>Shipping Information</th>
        <tr>
            <td>
                <b>Name: </b>
                <%=
                    order.getShippingName()
                %>
            </td>
        </tr>
        <tr>
            <td>
                <b>Address: </b>
                <%=
                    order.getShippingAddress()
                %>
            </td>
        </tr>
        <tr>
            <td>
                <b>Address Line 2: </b>
                <%=
                    order.getShippingAddressLine2()
                %>
            </td>
        </tr>
        <tr>
            <td>
                <b>City: </b>
                <%=
                    order.getShippingCity() + "\n"
                %>
                <b>State: </b>
                <%=
                    order.getShippingState() + "\n"
                %>
                <b>Zip: </b>
                <%=
                    order.getShippingZip() + "\n"
                %>
            </td>
        </tr>
        <th>Billing Information</th>
        <tr>
            <td>
                <b>Name: </b>
                <%=
                    order.getBillingName()
                %>
            </td>
        </tr>
        <tr>
            <td>
                <b>Address: </b>
                <%=
                    order.getBillingAddress()
                %>
            </td>
        </tr>
        <tr>
            <td>
                <b>Address Line 2: </b>
                <%=
                    order.getBillingAddressLine2()
                %>
            </td>
        </tr>
        <tr>
            <td>
                <b>City: </b>
                <%=
                order.getBillingCity() + "\n"
                %>
                <b>State: </b>
                <%=
                order.getBillingState() + "\n"
                %>
                <b>Zip: </b>
                <%=
                order.getBillingZip() + "\n"
                %>
            </td>
        </tr>
    </table>
    <form name="updateInfo" action="OrderInformation.jsp" method="get">
        <input type="submit" name="updateInfo" value="Edit Information" align="center">
    </form>
    </br>
    <% Calendar cal = Calendar.getInstance();
    int dayOfMonth = cal.get(Calendar.DAY_OF_MONTH);
    int dayOfDelivery = dayOfMonth;
    int currentMonth = cal.get(Calendar.MONTH);
    String deliveryMonth = "January";
    switch (currentMonth) {
    case 1:
    	deliveryMonth = "January";
    	break;
    case 2:
    	deliveryMonth = "February";
    	break;
    case 3:
    	deliveryMonth = "March";
    	break;
    case 4:
    	deliveryMonth = "April";
    	break;
    case 5:
    	deliveryMonth = "May";
    	break;
    case 6:
    	deliveryMonth = "June";
    	break;
    case 7:
    	deliveryMonth = "July";
    	break;
    case 8:
    	deliveryMonth = "August";
    	break;
    case 9:
    	deliveryMonth = "September";
    	break;
    case 10:
    	deliveryMonth = "October";
    	break;
    case 11:
    	deliveryMonth = "November";
    	break;
    case 12:
    	deliveryMonth = "December";
    	break;
    }
    for(int i = 0; i < 4; i++) {
    	dayOfDelivery++;
    	switch(currentMonth) {
    	case 1:
    		if(dayOfDelivery > 31) {
    			deliveryMonth = "February";
    			dayOfDelivery = 1;
    		}
    		break;
    	case 2:
    		if (dayOfDelivery > 28) {
    			deliveryMonth = "March";
    			dayOfDelivery = 1;
    		}
    		break;
    	case 3:
    		if(dayOfDelivery > 31) {
    			deliveryMonth = "April";
    			dayOfDelivery = 1;
    		}
    		break;
    	case 4:
    		if(dayOfDelivery > 30) {
    			deliveryMonth = "May";
    			dayOfDelivery = 1;
    		}
    		break;
    	case 5:
    		if(dayOfDelivery > 31) {
    			deliveryMonth = "June";
    			dayOfDelivery = 1;
    		}
    		break;
    	case 6:
    		if(dayOfDelivery > 30) {
    			deliveryMonth = "July";
    			dayOfDelivery = 1;
    		}
    		break;
    	case 7:
    		if(dayOfDelivery > 31) {
    			deliveryMonth = "August";
    			dayOfDelivery = 1;
    		}
    		break;
    	case 8:
    		if(dayOfDelivery > 31) {
    			deliveryMonth = "September";
    			dayOfDelivery = 1;
    		}
    		break;
    	case 9:
    		if(dayOfDelivery > 30) {
    			deliveryMonth = "October";
    			dayOfDelivery = 1;
    		}
    		break;
    	case 10:
    		if(dayOfDelivery > 31) {
    			deliveryMonth = "November";
    			dayOfDelivery = 1;
    		}
    		break;
    	case 11:
    		if(dayOfDelivery > 30) {
    			deliveryMonth = "December";
    			dayOfDelivery = 1;
    		}
    		break;
    	case 12:
    		if(dayOfDelivery > 31) {
    			deliveryMonth = "January";
    			dayOfDelivery = 1;
    		}
    		break;
    	}
    }
    
    out.println("<h4> The expected delivery date for your items is: " + deliveryMonth + " " + dayOfDelivery + "</h4>");%>
    
    
    <form name="checkout" action="ConfirmationController" method="post">
        <input type="submit" name="checkout" value="Place Order" align="center">
    </form>
</div>
<style>
    .CheckoutForms{
        text-align: center;
    }
    .Title{
        text-align: center;
    }
    .ShippingInfo
    {
        text-align: center;
    }
</style>
</body>
</html>