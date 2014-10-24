<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Customer - Home</title>
	</head>
	<body>
		<a href="showorder.jsp?id=1">Order 1</a>
		<form id="delete1" action="../../CoffeeService/orders/1" method="DELETE">
			<input type="submit" value="Cancel" />
		</form>
		<a href="updateorder.jsp?id=1">Update</a>
		<a href="payorder.jsp?id=1">Update</a>
		<form id="options1" action="../../CoffeeService/orders/1" method="OPTIONS">
			<input type="submit" value="Options" />
		</form>
	</body>
</html>