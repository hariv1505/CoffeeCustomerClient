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
		<i>Order Id</i>: ${order.id}<br>
		<i>Coffee Type</i>: ${order.coffeeType}<br>
		<i>Additions</i>: ${order.additions}<br>
		<i>Cost</i>: ${order.cost}<br>
		<c:choose>
			<c:when test="${order.released==null}">
				<i>Released</i>: False<br>
			</c:when>
			<c:otherwise> 
				<i>Released</i>: True<br>
			</c:otherwise>
		</c:choose>
	</body>
</html>