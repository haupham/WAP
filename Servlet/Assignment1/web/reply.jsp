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
          .container{
              width:550px;
              margin:auto;
              background-color: lightgray;
          }
          h3 {
              text-align: center;
          }

          .reply{
              text-align: justify;
              font-style: italic;
              padding: 5px;
          }

          .column {
              float: left;
              width: 40%;
              padding: 10px;
              height: auto;
          }


      </style>
  </head>
  <body>
        <h3>Servlet Assignment Response</h3>
        <div class="container">
                <fieldset>
                    <legend>Request Information</legend>
                <div class="column"><lable>Name:</lable></div>
                <div class="column">${name}</div>
                <div class="column"><lable>Email address:</lable></div>
                <div class="column">${email}</div>
                <div class="column"><lable>Problem:</lable></div>
                <div class="column">${problem}</div>
                <div class="column"><lable>Problem description (textarea):</lable></div>
                <div class="column">${probDesc}</div>

                </fieldset>
                <div>
                    <p class="reply">${autoReply}</p>
                </div>

        </div>
  </body>
</html>
