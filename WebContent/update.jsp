<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Customer - Update Order</title>
	</head>
	
	<body>
		<!-- change action based on id sent with GET request
			 if there is none, then it is making a new order - must be a POST, with new ID -->
		<h3>Enter order details and click on Update</h3>
		<form method="POST" >
			<!-- need to request all coffees here -->
			Coffee Type: <select name="coffeetype">
				<option value="cappuccino">Cappuccino</option>
				<option value="long_black">Long Black</option>
				<option value="latte">Latte</option>
				<option value="espresso">Espresso</option>
			</select>
			<input type="hidden" name="id" value="${id}"/>
			Cost: <input type="text" name="cost" /> <!-- doesn't make sense for client to change this -->
			Addtions: <input type="text" name="additions" />
			<input type="hidden" name="updateOrder" />
			<input type="submit" value="Update" />
		</form> 
	</body>
</html>