<%@ page import="Model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header id="masthead">
    <h1> WAP <span class="tagline"> <a href="product">Home</a> | <a href="cart.jsp">View Cart</a> |
        <c:choose>
           <c:when test="${currUsr.username != null}"><a href="logout">Logout</a> :: ${currUsr.name}</c:when>
            <c:otherwise><a href="login.jsp">Sign in</a></c:otherwise>
        </c:choose>
        </span></h1>


</header>