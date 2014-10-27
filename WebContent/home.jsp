<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Customer - Home</title>
	</head>
	<body>
		<b><i>${status} <b>${id}</b></i></b><br>
		<a href="addOrder?loadAddForm=true">New Order</a><br>
		<a href="showOrder?getAllOrders=true">All Orders</a><br><br>
		<!-- do for all coffees -->
		<c:forEach var="order" items="${orders}">
		<table style="width:25%">
			<tr>
				<td align="center">Order:<b>${order.id}</b></td>
				<td align="center"><a href="showOrder?id=${order.id}&getOneOrder=true">View</a></td>
				<td align="center"><a href="deleteOrder?id=${order.id}&delete=true">Cancel</a></td>
				<td align="center"><a href="updateOrder?id=${order.id}&loadUpdateForm=true">Update</a><td>
				<td align="center"><a href="pay?id=${order.id}&loadPayForm=true">Pay</a><td>
			</tr>
		</table>
		</c:forEach>
		<form id="options1" action="../CoffeeService/orders/1" method="OPTIONS">
				<input type="submit" value="Options" />
			</form>
		<!-- display payment if there is an associated one -->
	</body>
</html>