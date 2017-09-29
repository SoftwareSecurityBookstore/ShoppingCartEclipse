<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Information - Checkout</title>
</head>
<style>
    pre {
        font-family: "Times New Roman";
    }
</style>
<body>
    <table width = "75%">
        <tr>
            <td width= "75%"><a href="${pageContext.request.contextPath}/index.jsp"><img src="image/images/ksu (1).png" width="350" height="100" alt="Kennesaw Logo"></a></td>
            <td width="25%">
                <a href="shoppingCart.jsp"><img src="image/images/cart.png" alt="cart" width="80" height ="80"/></a>
            </td>
        </tr>
    </table>
    <h1>&emsp;&emsp;Order Information</h1>
    <form method='POST' action='${pageContext.request.contextPath}/OrderInfoController'>
        <table>
            <tr>
                <td>
                    <p style="text-align: right"> Name:</p>
                </td>
                <td>
                    <input type='text' name='shippingName' value='' placeholder='Name'/>
                </td>
            </tr>
            <tr>
                <td>
                    <p style="text-align: right"> &emsp;Address Line 1:</p>
                </td>
                <td>
                    <input type='text' name='shippingAddress' value='' placeholder='Address'/>
                </td>
            </tr>
            <tr>
                <td>
                    <p style="text-align: right"> &emsp;Address Line 2:</p>
                </td>
                <td>
                    <input type='text' name='shippingAddressLine2' value='' placeholder='APT #, P.O. Box #, etc'/>
                </td>
            </tr>
            <tr>
                <td>
                    <p style="text-align: right"> City:</p>
                </td>
                <td>
                    <input type='text' name='shippingCity' value='' placeholder='City'/>
                </td>
            </tr>
            <tr>
                <td>
                    <p style="text-align: right"> State</p>
                </td>
                <td>
                    <select name="shippingState">
                        <option value="AL">Alabama</option>
                        <option value="AK">Alaska</option>
                        <option value="AZ">Arizona</option>
                        <option value="AR">Arkansas</option>
                        <option value="CA">California</option>
                        <option value="CO">Colorado</option>
                        <option value="CT">Connecticut</option>
                        <option value="DE">Delaware</option>
                        <option value="DC">District Of Columbia</option>
                        <option value="FL">Florida</option>
                        <option value="GA">Georgia</option>
                        <option value="HI">Hawaii</option>
                        <option value="ID">Idaho</option>
                        <option value="IL">Illinois</option>
                        <option value="IN">Indiana</option>
                        <option value="IA">Iowa</option>
                        <option value="KS">Kansas</option>
                        <option value="KY">Kentucky</option>
                        <option value="LA">Louisiana</option>
                        <option value="ME">Maine</option>
                        <option value="MD">Maryland</option>
                        <option value="MA">Massachusetts</option>
                        <option value="MI">Michigan</option>
                        <option value="MN">Minnesota</option>
                        <option value="MS">Mississippi</option>
                        <option value="MO">Missouri</option>
                        <option value="MT">Montana</option>
                        <option value="NE">Nebraska</option>
                        <option value="NV">Nevada</option>
                        <option value="NH">New Hampshire</option>
                        <option value="NJ">New Jersey</option>
                        <option value="NM">New Mexico</option>
                        <option value="NY">New York</option>
                        <option value="NC">North Carolina</option>
                        <option value="ND">North Dakota</option>
                        <option value="OH">Ohio</option>
                        <option value="OK">Oklahoma</option>
                        <option value="OR">Oregon</option>
                        <option value="PA">Pennsylvania</option>
                        <option value="RI">Rhode Island</option>
                        <option value="SC">South Carolina</option>
                        <option value="SD">South Dakota</option>
                        <option value="TN">Tennessee</option>
                        <option value="TX">Texas</option>
                        <option value="UT">Utah</option>
                        <option value="VT">Vermont</option>
                        <option value="VA">Virginia</option>
                        <option value="WA">Washington</option>
                        <option value="WV">West Virginia</option>
                        <option value="WI">Wisconsin</option>
                        <option value="WY">Wyoming</option>
                        <option value="AS">American Samoa</option>
                        <option value="GU">Guam</option>
                        <option value="MP">Northern Mariana Islands</option>
                        <option value="PR">Puerto Rico</option>
                        <option value="UM">United States Minor Outlying Islands</option>
                        <option value="VI">Virgin Islands</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <p style="text-align: right"> Zip:</p>
                </td>
                <td>
                    <input type='text' name='shippingZip' value='' placeholder='Zip Code'/>
                </td>
            </tr>
            <tr>
                <br>
                <td><p style="text-align: right"> Email:</p></td>
                <td> <input type="email" name='email' value='' placeholder='Email Address'></td>
            </tr>
        </table>

        <pre>           <input type="checkbox" name="shippingAsBilling" value="yes"> Shipping Address is same as Billing address </pre>

        <table>
            <tr>
                <td>
                    <p style="text-align: right"> Name:</p>
                </td>
                <td>
                    <input type='text' name='billingName' value='' placeholder='Name'/>
                </td>
            </tr>
            <tr>
                <td>
                    <p style="text-align: right"> &emsp;Address Line 1:</p>
                </td>
                <td>
                    <input type='text' name='billingAddress' value='' placeholder='Address'/>
                </td>
            </tr>
            <tr>
                <td>
                    <p style="text-align: right"> &emsp;Address Line 2:</p>
                </td>
                <td>
                    <input type='text' name='billingAddressLine2' value='' placeholder='APT #, P.O. Box #, etc'/>
                </td>
            </tr>
            <tr>
                <td>
                    <p style="text-align: right"> City:</p>
                </td>
                <td>
                    <input type='text' name='billingCity' value='' placeholder='City' >
                </td>
            </tr>
            <tr>
                <td>
                    <p style="text-align: right"> State</p>
                </td>
                <td>
                    <select name="billingState">
                        <option value="AL">Alabama</option>
                        <option value="AK">Alaska</option>
                        <option value="AZ">Arizona</option>
                        <option value="AR">Arkansas</option>
                        <option value="CA">California</option>
                        <option value="CO">Colorado</option>
                        <option value="CT">Connecticut</option>
                        <option value="DE">Delaware</option>
                        <option value="DC">District Of Columbia</option>
                        <option value="FL">Florida</option>
                        <option value="GA">Georgia</option>
                        <option value="HI">Hawaii</option>
                        <option value="ID">Idaho</option>
                        <option value="IL">Illinois</option>
                        <option value="IN">Indiana</option>
                        <option value="IA">Iowa</option>
                        <option value="KS">Kansas</option>
                        <option value="KY">Kentucky</option>
                        <option value="LA">Louisiana</option>
                        <option value="ME">Maine</option>
                        <option value="MD">Maryland</option>
                        <option value="MA">Massachusetts</option>
                        <option value="MI">Michigan</option>
                        <option value="MN">Minnesota</option>
                        <option value="MS">Mississippi</option>
                        <option value="MO">Missouri</option>
                        <option value="MT">Montana</option>
                        <option value="NE">Nebraska</option>
                        <option value="NV">Nevada</option>
                        <option value="NH">New Hampshire</option>
                        <option value="NJ">New Jersey</option>
                        <option value="NM">New Mexico</option>
                        <option value="NY">New York</option>
                        <option value="NC">North Carolina</option>
                        <option value="ND">North Dakota</option>
                        <option value="OH">Ohio</option>
                        <option value="OK">Oklahoma</option>
                        <option value="OR">Oregon</option>
                        <option value="PA">Pennsylvania</option>
                        <option value="RI">Rhode Island</option>
                        <option value="SC">South Carolina</option>
                        <option value="SD">South Dakota</option>
                        <option value="TN">Tennessee</option>
                        <option value="TX">Texas</option>
                        <option value="UT">Utah</option>
                        <option value="VT">Vermont</option>
                        <option value="VA">Virginia</option>
                        <option value="WA">Washington</option>
                        <option value="WV">West Virginia</option>
                        <option value="WI">Wisconsin</option>
                        <option value="WY">Wyoming</option>
                        <option value="AS">American Samoa</option>
                        <option value="GU">Guam</option>
                        <option value="MP">Northern Mariana Islands</option>
                        <option value="PR">Puerto Rico</option>
                        <option value="UM">United States Minor Outlying Islands</option>
                        <option value="VI">Virgin Islands</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <p style="text-align: right"> Zip:</p>
                </td>
                <td>
                    <input type='text' name='billingZip' value='' placeholder='Zip Code' maxlength='5'/>
                </td>
            </tr>
        </table>

        <pre>           <input type="submit" value="Submit" name="orderInfoSubmit"></pre>
    </form>
</body>
</html>
