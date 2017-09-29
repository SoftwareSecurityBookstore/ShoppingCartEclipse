<%--
  Created by IntelliJ IDEA.
  User: Adam Hayes
  Date: 4/29/2017
  Time: 8:31 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Paypal Login</title>
</head>
<body>
<table width = "75%">
    <tr>
        <td width= "75%"><a href="${pageContext.request.contextPath}/index.jsp"><img src="image/images/PayPal.png" width="350" height="100" alt="Paypal Logo"></a></td>
        <td width="25%">
            <a href="shoppingCart.jsp"><img src="image/images/cart.png" alt="cart" width="80" height ="80"/></a>
        </td>
    </tr>
</table>

<h1>&emsp;Please Login to your PayPal Account</h1>
<form method="post" action="${pageContext.request.contextPath}/paypalController">
    <table>
        <tr>
            <td style="text-align: right">&emsp;Email Address: </td>
            <td><input type="email" name="paypalEmail" value=""></td>
        </tr>
        <tr>
            <td style="text-align: right">Password:</td>
            <td><input type="password" name="paypalPassword" value=""></td>
        </tr>
    </table>
    <br>
    <br>
    <pre>           <input type="submit" name="submitPaypal" value="Submit"/></pre>
</form>
</body>
</html>
