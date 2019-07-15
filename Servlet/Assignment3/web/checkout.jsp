<!DOCTYPE html>
<html>
<head>
<title>Perfume: Checkout</title>
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
		<h1>Checkout</h1>
			<table id="checkout-cart" class="shopping-cart">
			  <thead>
				<tr>
					<th scope="col">Item</th>
					<th scope="col">Qty</th>
					<th scope="col">Price</th>
				</tr>
			  </thead>
			  <tbody>
			  
			  </tbody>
			</table>
		 <div id="pricing">
			
			<p id="shipping">
				<strong>Shipping</strong>: <span id="sshipping"></span>
			</p>
			
			<p id="sub-total">
				<strong>Total</strong>: <span id="stotal"></span>
			</p>
		 </div>
		 
		 <form action="order.jsp" method="post" id="checkout-order-form">
		 	<h2>Your Details</h2>
		 	
		 	<fieldset id="fieldset-billing">
		 		<legend>Billing</legend>
		 		<div>
		 			<label for="name">Name</label>
		 			<input type="text" name="name" id="name" data-type="string" data-message="This field cannot be empty" value="${currUsr.name}"/>
		 		</div>
		 		<div>
		 			<label for="email">Email</label>
		 			<input type="text" name="email" id="email" data-type="expression" data-message="Not a valid email address"  value="${currUsr.email}" />
		 		</div>
		 		<div>
		 			<label for="city">City</label>
		 			<input type="text" name="city" id="city" data-type="string" data-message="This field cannot be empty"  value="${currUsr.city}"/>
		 		</div>
		 		<div>
		 			<label for="address">Address</label>
		 			<input type="text" name="address" id="address" data-type="string" data-message="This field cannot be empty" value="${currUsr.address}"/>
		 		</div>
		 		<div>
		 			<label for="zip">ZIP Code</label>
		 			<input type="text" name="zip" id="zip" data-type="string" data-message="This field cannot be empty"  value="${currUsr.zipcode}"/>
		 		</div>
		 		<div>
		 			<label for="country">Country</label>
		 			<select name="country" id="country" data-type="string" data-message="This field cannot be empty">
		 				<option value="">Select</option>
		 				<option value="US" selected>USA</option>
		 			</select>
		 		</div>
		 	</fieldset>
		 	
		 	<div id="shipping-same">Same as Billing <input type="checkbox" id="same-as-billing" value=""/></div>
		 	
		 	<fieldset id="fieldset-shipping">
		 		
		 		<legend>Shipping</legend>
		 		
		 		<div>
		 			<label for="sname">Name</label>
		 			<input type="text" name="sname" id="sname" data-type="string" data-message="This field cannot be empty" />
		 		</div>
		 		<div>
		 			<label for="semail">Email</label>
		 			<input type="text" name="semail" id="semail" data-type="expression" data-message="Not a valid email address" />
		 		</div>
		 		<div>
		 			<label for="scity">City</label>
		 			<input type="text" name="scity" id="scity" data-type="string" data-message="This field cannot be empty" />
		 		</div>
		 		<div>
		 			<label for="saddress">Address</label>
		 			<input type="text" name="saddress" id="saddress" data-type="string" data-message="This field cannot be empty" />
		 		</div>
		 		<div>
		 			<label for="szip">ZIP Code</label>
		 			<input type="text" name="szip" id="szip" data-type="string" data-message="This field cannot be empty" />
		 		</div>
		 		<div>
		 			<label for="scountry">Country</label>
		 			<select name="scountry" id="scountry" data-type="string" data-message="This field cannot be empty">
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