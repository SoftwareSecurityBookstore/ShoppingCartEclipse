<%--
  Created by IntelliJ IDEA.
  User: Bookstore
  Date: 4/26/2017
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment Information</title>
</head>
<body>
<table width = "75%">
    <tr>
        <td width= "75%"><a href="${pageContext.request.contextPath}/index.jsp"><img src="image/images/ksu (1).png" width="350" height="100" alt="Kennesaw Logo"></a></td>
        <td width="25%">
            <a href="shoppingCart.jsp"><img src="image/images/cart.png" alt="cart" width="80" height ="80"/></a>
        </td>
    </tr>
</table>

    <h1>&emsp;&emsp;Please Select a Payment Type</h1>
    <form method="post" action='${pageContext.request.contextPath}/paymentInfoController'>
        <label> &emsp;Visa/Mastercard <input type="radio" name="paymentSelect" value="creditCard" checked/></label>
        <br>
        <br>
        <label>&emsp;Name on Card: <input type="text" name="nameOnCard" placeholder="e.g. John Doe"/></label><br>
        <label>&emsp;Credit Card Number: <input type="number" name="cardNumber" maxlength="16" value="" placeholder="16 Digit Card #"/></label><br>
        <label>&emsp;Exp Date:
            <select name="month">
                <option value="01">01</option>
                <option value="02">02</option>
                <option value="03">03</option>
                <option value="04">04</option>
                <option value="05">05</option>
                <option value="06">06</option>
                <option value="07">07</option>
                <option value="08">08</option>
                <option value="09">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
        </select></label>
        /
        <input type="number" name="year" maxlength="4" value="" placeholder="e.g. 2017"/><br>
        <label>&emsp;CVV: <input type="number" name="cvv" maxlength="3" value="" placeholder="e.g. 123"/></label>
        <br>
        <br>
        <label>&emsp;PayPal <input type="radio" name="paymentSelect" value="paypal"/></label>
        <br>
        <br>
        <label>&emsp;Financial Aid <input type="radio" name="paymentSelect" value="financialAid"/></label>
        <br>
        <br>
        <pre>           <input type="submit" value="Submit" name="paymentOptionSubmit"></pre>
    </form>
</body>
</html>
