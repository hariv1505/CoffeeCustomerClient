<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Customer - Home</title>
	</head>
	<body>
		<a href="addorupdate.jsp">New Order</a>
		
		<!-- do for all coffees -->
		<a href="showOrder?id=7&getOneOrder=true">Order 1</a>
		<form id="delete1" action="../CoffeeService/orders/1" method="DELETE">
			<input type="submit" value="Cancel" />
		</form>
		<a href="addorupdate.jsp?id=1">Update</a>
		<form id="pay1" action="../CoffeeService/payments/1" method="PUT">
			<input type="submit" value="Pay" />
		</form>
		<form id="options1" action="../CoffeeService/orders/1" method="OPTIONS">
			<input type="submit" value="Options" />
		</form>
		
		<!-- display payment if there is an associated one -->
	</body>
</html>