<%--
  Created by IntelliJ IDEA.
  User: haupham
  Date: 7/14/19
  Time: 5:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
      <title>Perfume.com</title>
      <meta charset="utf-8" />
      <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
      <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
      <script type="text/javascript" src="js/jquery.shop.js"></script>
  </head>
  <body>

  <div id="site">
      <jsp:include page="header.jsp"></jsp:include>
      <div id="content">
          <div id="products">
              <ul>
                <c:forEach items="${requestScope['products']}" var="product">
                  <li>
                      <div class="product-image">
                          <img src="images/${product.prdImg}" alt="${product.prdImg}" />
                      </div>
                      <div class="product-description" data-name="${product.prdDesc}" data-price="${product.prdPrice}">
                          <h3 class="product-name">${product.prdName}</h3>
                          <p class="product-price">&dollar; ${product.prdPrice}</p>
                          <form class="add-to-cart" action="cart.jsp" method="post">
                              <div>
                                  <label for="qty-1">Quantity</label>
                                  <input type="number" name="qty-1" id="qty-1"  min="1" max="9999" class="qty" value="1"  />
                              </div>
                              <p><input type="submit" value="Add to cart" class="btn" /></p>
                          </form>
                      </div>
                  </li>
                </c:forEach>
              </ul>
          </div>
      </div>


  </div>

  <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
