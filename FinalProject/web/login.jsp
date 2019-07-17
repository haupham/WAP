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
    <title>Sign In</title>
    <link rel="stylesheet" href="css/custom.css" media="screen" type="text/css" >

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
                <legend>SignIn Form</legend>
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
                    &nbsp;&nbsp;<a href="signup.jsp">Sign up</a>
                </div>
            </fieldset>
        </form>
        <div>
            <span style="color:red;text-align: center">${msgError}</span>
        </div>
    </div>

</body>
</html>
