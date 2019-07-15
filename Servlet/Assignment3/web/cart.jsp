<%--
  Created by IntelliJ IDEA.
  User: haupham
  Date: 7/14/19
  Time: 5:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Perfume: Your Shopping Cart</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.shop.js"></script>
</head>
<body>
<div id="site">
    <jsp:include page="header.jsp"></jsp:include>
    <div id="content">
        <h1>Your Shopping Cart</h1>
        <form id="shopping-cart" action="cart.jsp" method="post">
            <table class="shopping-cart">
                <thead>
                <tr>
                    <th scope="col">Item</th>
                    <th scope="col">Qty</th>
                    <th scope="col" colspan="2">Price</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
            <p id="sub-total">
                <strong>Sub Total</strong>: <span id="stotal"></span>
            </p>
            <ul id="shopping-cart-actions">
                <li>
                    <input type="submit" name="update" id="update-cart" class="btn" value="Update Cart" />
                </li>
                <li>
                    <input type="submit" name="delete" id="empty-cart" class="btn" value="Empty Cart" />
                </li>
                <li>
                    <a href="product" class="btn">Continue Shopping</a>
                </li>
                <li>
                    <a href="checkout.jsp" class="btn">Go To Checkout</a>
                </li>
            </ul>
        </form>
    </div>



</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
