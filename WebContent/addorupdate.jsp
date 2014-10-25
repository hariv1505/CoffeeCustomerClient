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
		<form action="../orders/1" method="PUT" >
			<!-- need to request all coffees here -->
			<select id="coffeetype">
				<option value="">None</option>
			</select>
			<input type="text" id="cost" /> <!-- doesn't make sense for client to change this -->
			<input type="text" id="additions" />
			<input type="submit" value="Update" />
		</form> 
	</body>
</html>