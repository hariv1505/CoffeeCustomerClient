<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Customer - New Order</title>
	</head>
	
	<body>
		<!-- change action based on id sent with GET request
			 if there is none, then it is making a new order - must be a POST, with new ID -->
		<h3>Enter payment details and click on Submit</h3>
		<h4>Order Number <b>${id}</b></h4>
		<form method="POST" >
			<!-- need to request all coffees here -->
			<select name="paytype">
				<option value="cash">Cash</option>
				<option value="card">Card</option>
			</select>
			Card Details: <input type="text" name="card_details" />
			<input type="hidden" name="id" value="${id}"/>
			<input type="hidden" name="payForOrder" />
			<input type="submit" value="Pay" />
		</form> 
	</body>
</html>