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
		<b><i>${status} <b>${id}</b></i></b> ${options}<br>
		<a href="addOrder?loadAddForm=true">New Order</a><br>
		<a href="showOrder?getAllOrders=true">All Orders</a><br><br>
		<!-- do for all coffees -->
		<c:forEach var="order" items="${orders}">
		<c:set var="flag" value="0"/>
		<table style="width:25%">
			<tr>
				<td align="center">Order:<b>${order.id}</b></td>
				<td align="center"><a href="showOrder?id=${order.id}&getOneOrder=true">View</a></td>
				<td align="center"><a href="deleteOrder?id=${order.id}&delete=true">Cancel</a></td>
				<td align="center"><a href="updateOrder?id=${order.id}&loadUpdateForm=true">Update</a><td>
				<td align="center"><a href="pay?id=${order.id}&loadPayForm=true">Pay</a><td>
				<td align="center"><a href="options?id=${order.id}&showOptions=true">Options</a><td>
			</tr>
			<tr>
				<c:forEach var="paidOrder" items="${paidOrders}">
					<c:if test="${paidOrder.id==order.id}">
					<c:set var="flag" value="1"/>
					</c:if>
				</c:forEach>
				<c:if test="${flag==1}">
					<td align="center">Payment:<b>${order.id}</b></td>
					<td align="center"><a href="showPayment?id=${order.id}&getOnePayment=true">View</a></td>
				</c:if>
			</tr>
		</table>
		</c:forEach>
	</body>
</html>