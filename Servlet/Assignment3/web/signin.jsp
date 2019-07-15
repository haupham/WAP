<!DOCTYPE html>
<html>
<head>
<title>Perfume: SignIn</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.shop.js"></script>
</head>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body id="checkout-page">
<div id="site">
	<jsp:include page="header.jsp"></jsp:include>
	<div id="content">
		<h1>SignIn</h1>
		 <form action="signin.jsp" method="post">
		 	<h2>Your Details</h2>
		 	
		 	<fieldset id="fieldset-billing">
		 		<legend>SignIn</legend>
		 		<div class="col-md-4 col-sm-6 col-12">
		 			<label for="name">Name</label>
		 			<input type="text" name="name" id="name" data-type="string" data-message="This field cannot be empty" />
		 		</div>
		 		<div class="col-md-4 col-sm-6 col-12">
		 			<label for="email">Email</label>
		 			<input type="text" name="email" id="email" data-type="expression" data-message="Not a valid email address" />
		 		</div>
		 		<div class="col-md-4 col-sm-6 col-12">
		 			<label for="city">City</label>
		 			<input type="text" name="city" id="city" data-type="string" data-message="This field cannot be empty" />
		 		</div>
		 		<div class="col-md-4 col-sm-6 col-12">
		 			<label for="address">Address</label>
		 			<input type="text" name="address" id="address" data-type="string" data-message="This field cannot be empty" />
		 		</div>
		 		<div class="col-md-4 col-sm-6 col-12">
		 			<label for="zip">ZIP Code</label>
		 			<input type="text" name="zip" id="zip" data-type="string" data-message="This field cannot be empty" />
		 		</div>
		 		<div class="col-md-4 col-sm-6 col-12">
		 			<label for="country">Country</label>
		 			<select name="country" id="country" data-type="string" data-message="This field cannot be empty">
		 				<option value="">Select</option>
		 				<option value="US" selected>USA</option>
		 			</select>
		 		</div>
		 	</fieldset>
		 	
		 	<p><input type="submit" id="submit-order" value="Submit" class="btn" /></p>
		 
		 </form>
	</div>
	
	

</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>	