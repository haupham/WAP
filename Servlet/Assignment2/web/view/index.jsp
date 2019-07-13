<%--
  Created by IntelliJ IDEA.
  User: haupham
  Date: 7/11/19
  Time: 10:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Servlet Day 2</title>
    <style>
        .container {
            width: 550px;
            margin: auto;
            background-color: lightgray;
        }

        h3 {
            text-align: center;
        }

        .column {
            float: left;
            width: 40%;
            padding: 10px;
            height: auto;
        }

        .column:after {
            clear: both;
        }

        .button {
            width: 250px;
            heigh:50px;
            padding:5px;
            background-color: lightseagreen;
        }
    </style>

</head>
<body>
    <h3>Servlet 2 :: Login Form</h3>

    <div class="container">
        <form action="login" method="POST">

            <% String error = request.getAttribute("msg") != null ? request.getAttribute("msg").toString() : "" ;%>
            <%
                String username = "";
                String remember = "";
                Cookie[] cookies = request.getCookies();
                for (Cookie cookie: cookies) {
                    if(cookie.getName().equals("wap.username") && !cookie.getValue().isEmpty()) {
                        username = cookie.getValue();
                        remember = "checked";
                    }
                }
            %>
            <span style="color:red;text-align:center;">${msg}</span>
            <fieldset class="fldset">
                <legend>Servlet Form</legend>
                <div class="column">
                    <lable>Username:</lable>
                </div>
                <div class="column"><input type="text" name="username" required value="<%=username%>"/></div>
                <div class="column">
                    <lable>Password:</lable>
                </div>
                <div class="column"><input type="password" name="password" required/></div>
                <div class="column">
                    <lable>Remember me</lable>
                </div>
                <div class="column"><input type="checkbox" name="remember" <%=remember%> /></div>
                <div class="column">
                    <input class="button" type="submit" value=" Login "/>
                </div>

            </fieldset>

        </form>
    </div>

</body>
</html>
