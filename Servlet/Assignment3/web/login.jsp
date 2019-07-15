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
    <title>Perfume:Login</title>
    <style>

        body {
            font: 100%/1 'Roboto', serif;
            background: #fafafa;
            color: #333;
            border-top: 0.5em solid #cc8500;
        }

        .container {
            width: 550px;
            margin: auto;
           /* background-color: lightgray;*/
        }

        h1 {
            text-align: center;
            margin: 10px 20px;
            font-size: 3.5em;
            overflow: hidden;
            padding-left: 85px;
            min-height: 82px;
            line-height: 2;
            background: url(images/mum_logo.png) no-repeat;
            background-size: 80px 80px;
            color: #900;
        }

        .column {
            float: left;
            width: 40%;
            padding: 10px;
            height: auto;
        }

        .clear {
            clear: both;
            text-align: center;
        }

        .btn {
            width: 250px;
            heigh:50px;
            padding:5px;
            background: #cc1400;
            color: #fff;
            font: 1em 'PT Serif', serif;
            padding: 0.3em 1em;
            text-align: center;
            border-radius: 4px;
            border: 1px solid #a00;
        }
    </style>

</head>
<body>


    <div class="container">
        <h1 >WAP</h1>
        <form action="signin" method="POST">

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
            <fieldset>
                <legend>Login Form</legend>
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

                <div class="clear">
                    <input class="btn" type="submit" value=" Login "/>
                </div>
            </fieldset>
        </form>
        <div>
            <span style="color:red;text-align: center">${msgError}</span>
        </div>
    </div>

</body>
</html>
