<%--
  Created by IntelliJ IDEA.
  User: haupham
  Date: 7/9/19
  Time: 11:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Servlet 1</title>
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
<h3>Servlet Assignment 1</h3>
<div class="container">
    <form action="support" method="POST">
        <fieldset class="fldset">
            <legend>Servlet Form</legend>
            <div class="column">
                <lable>Name:</lable>
            </div>
            <div class="column"><input type="text" name="name"/></div>
            <div class="column">
                <lable>Email address:</lable>
            </div>
            <div class="column"><input type="text" name="email"/></div>
            <div class="column">
                <lable>Problem:</lable>
            </div>
            <div class="column"><input type="text" name="problem"/></div>
            <div class="column">
                <lable>Problem description (textarea):</lable>
            </div>
            <div class="column"><textarea cols="35" rows="10" name="probDesc"></textarea></div>
            <div class="column"></div>
            <div class="column">
                <input class="button" type="submit" value=" Help "/>
            </div>
        </fieldset>

    </form>
</div>
</body>
</html>
