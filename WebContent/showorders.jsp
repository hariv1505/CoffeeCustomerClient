<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Customer - Show Order</title>
	</head>
	<body>
	<c:forEach var="order" items="${orders}">
		<i>Order Number</i>: <b>${order.id}</b><br>
		<i>Coffee Typ</i>e: ${order.coffeeType}<br>
		<i>Additions</i>: ${order.additions}<br>
		<i>Cost</i>: ${order.cost}<br>
	</c:forEach>
	</body>
</html>