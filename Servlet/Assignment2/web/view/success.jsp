<%--
  Created by IntelliJ IDEA.
  User: haupham
  Date: 7/11/19
  Time: 11:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Logout</title>
    <style>
        .container{
            width:550px;
            margin:auto;
        }
        .container > div{
            width:200px;
            margin:auto;
            padding:10px;
            border:1px solid lightblue;
            background-color: aquamarine;
            text-align: center;
        }
        a {
            text-decoration: none;
        }
        h3 {
            text-align: center;
        }
    </style>

</head>
<body>
    <h3>Login Successfully!! Current user: ${sessionScope.currtUsr.username}</h3>
    <div class="container">
        <div>
            <a href="<c:url value="/logout" context="/day2" />"> >> Click here to Log out</a>
        </div>
    </div>
</body>
</html>
