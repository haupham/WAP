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
      <link rel="stylesheet" href="css/custom.css" media="screen" type="text/css" />
      <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
  </head>
  <body>
  <div id="site">
      <jsp:include page="header.jsp"></jsp:include>

      <div class="tab">
          <button class="tablinks" onclick="openTab(event, 'products')">Producs</button>
          <button class="tablinks" onclick="openTab(event, 'users')">Users</button>
      </div>
      <div id="products" class="tabcontent">
          <table border="1" cellpadding="5">
              <caption><h2>List of products</h2></caption>
              <tr>
                  <th>Name</th>
                  <th>Price</th>
                  <th>Desc</th>
                  <th>Image</th>
              </tr>
              <tbody>
              <c:forEach var="product" items="${requestScope['products']}">
                  <tr>
                      <td><c:out value="${product.prdName}" /></td>
                      <td><c:out value="${product.prdPrice}" /></td>
                      <td><c:out value="${product.prdDesc}" /></td>
                      <td><img src="images/${product.prdImg}" alt="product image" style="width: 50px; height: 50px;"/></td>
                  
                  </tr>
              </c:forEach>
              </tbody>
          </table>

          <!-- Begin new product-->
          <hr><br>
          <form>
              <fieldset id="fieldset-billing">
                  <legend>Product information</legend>
                  <div class="column">
                      <label for="prdName">Name</label>
                  </div>
                  <div class="column">
                      <input type="text" name="prdName" id="prdName" data-type="string" data-message="This field cannot be empty" />
                  </div>
                  <div class="column">
                      <label for="prdImg">Image</label>
                  </div>
                  <div class="column">
                      <input type="text" disabled name="prdImg" id="prdImg" value="noImg.png" data-type="string"/>
                  </div>
                  <div class="column">
                      <label for="prdPrice">Price</label>
                  </div>
                  <div class="column">
                      <input type="number" name="prdPrice" min="1" max="999"  id="prdPrice" data-type="number" data-message="This field cannot be empty" />
                  </div>
                  <div class="column">
                      <label for="prdDesc">Description</label>
                  </div>
                  <div class="column">
                      <input type="text" name="prdDesc" id="prdDesc" data-type="string" />
                  </div>
                  <div class="clear">
                      <input type="button" id="addProduct" value="Add Product" class="btn" />
                  </div>
              </fieldset>


          </form>
          <!-- End new Product -->


      </div>

      <div id="users" class="tabcontent">
          <h3>List of users</h3>
          <table border="1" cellpadding="5">
          <tr>
                <th>Username</th>
                <th>Password</th>
                <th>Email</th>
                <th>Name</th>
            </tr>
            <c:forEach var="user" items="${requestScope['users']}">
                <tr>
                    <td><c:out value="${user.username}" /></td>
                    <td><c:out value="${user.password}" /></td>
                    <td><c:out value="${user.email}" /></td>
                    <td><c:out value="${user.name}" /></td>
                </tr>
            </c:forEach>
        </table>
      </div>

      <script>
          function openTab(evt, id) {
              var i, tabcontent, tablinks;
              tabcontent = document.getElementsByClassName("tabcontent");
              for (i = 0; i < tabcontent.length; i++) {
                  tabcontent[i].style.display = "none";
              }
              tablinks = document.getElementsByClassName("tablinks");
              for (i = 0; i < tablinks.length; i++) {
                  tablinks[i].className = tablinks[i].className.replace(" active", "");
              }
              document.getElementById(id).style.display = "block";
              evt.currentTarget.className += " active";

          }
          $("#addProduct").click(function(){
             addProduct();
          });

          function addProduct() {
              var data = {
                  id:null,
                  prdName :$("#prdName").val(),
                  prdImg:$("#prdImg").val(),
                  prdPrice:$("#prdPrice").val(),
                  prdDesc :$("#prdDesc").val()
              }
              $.ajax({
                  type: "POST",
                  url: '/lab3/admin',
                  dataType: "json",
                  data: JSON.stringify(data),
                  contentType: 'application/json',
                  mimeType: 'application/json',
                  complete: [
                      function (response) {
                          $("#products").find("tr:not(:first)").remove();
                          var trHTML = '';
                          var obj = $.parseJSON(response.responseText);
                          for (var i = 0; i < obj.length; i++) {
                              trHTML += '<tr><td><label>' + obj[i].prdName + '</label></td><td>' + obj[i].prdPrice + '</td><td>' + obj[i].prdDesc + '</td><td><img style="width:50px;height: 50px;" src="images/' + obj[i].prdImg + '"/></td></tr>';
                          }
                          $("#products tbody").append(trHTML);
                      }
                  ]
              });
          }
      </script>

  </div>

  <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
