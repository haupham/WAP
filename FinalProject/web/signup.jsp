<!DOCTYPE html>
<html>
<head>
<title>Perfume: SignIn</title>
<meta charset="utf-8" />
    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
    <link rel="stylesheet" href="css/custom.css" media="screen" type="text/css"/>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.shop.js"></script>
</head>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body id="checkout-page">
<div id="site">
	<jsp:include page="header.jsp"></jsp:include>
	<div id="container">

		 <form action="signup" method="post">
		 	
		 	<fieldset id="fieldset-billing">
		 		<legend>Your information</legend>
                <div class="column">
                    <label for="username">Username</label>
                </div>
                <div class="column">
                    <input type="text" name="username" id="username" data-type="string" data-message="This field cannot be empty" />
                </div>
                <div class="column">
                    <label for="password">Password</label>
                </div>
                <div class="column">
                    <input type="password" name="password" id="password" data-type="string" data-message="This field cannot be empty" />
                </div>
		 		<div class="column">
		 			<label for="name">Name</label>
                </div>
                <div class="column">
		 			<input type="text" name="name" id="name" data-type="string" data-message="This field cannot be empty" />
		 		</div>
		 		<div class="column">
		 			<label for="email">Email</label>
                </div>
                <div class="column">
		 			<input type="text" name="email" id="email" data-type="expression" data-message="Not a valid email address" />
		 		</div>
		 		<div class="column">
		 			<label for="city">City</label>
                </div>
                <div class="column">
		 			<input type="text" name="city" id="city" data-type="string" data-message="This field cannot be empty" />
		 		</div>
		 		<div class="column">
		 			<label for="address">Address</label>
                </div>
                <div class="column">
		 			<input type="text" name="address" id="address" data-type="string" data-message="This field cannot be empty" />
		 		</div>
		 		<div class="column">
		 			<label for="zipcode">ZIP Code</label>
                </div>
                <div class="column">
                    <input type="text" name="zipcode" id="zipcode" data-type="string" data-message="This field cannot be empty" />
		 		</div>
		 		<div class="column">
		 			<label for="country">Country</label>
                </div>
                <div class="column">
		 			<select name="country" id="country" data-type="string" data-message="This field cannot be empty">
		 				<option value="">Select</option>
		 				<option value="US" selected>USA</option>
		 			</select>
		 		</div>
                <div class="clear">
                    <input type="submit" id="signup" value="Submit" class="btn" />
                </div>
		 	</fieldset>

		 
		 </form>
	</div>
	
	

</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>	