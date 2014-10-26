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
		<b>${order.id}</b><br>
		${order.coffeeType}<br>
		${order.additions}<br>
		${order.cost}<br>
		${order.detail}<br>
	</c:forEach>
		<%
			//int id = 0;		//get this from "id" parameter of GET request
			//ClientResponse response = service.path("rest").path("orders")
			//.path(o.getId()).accept(MediaType.APPLICATION_XML).put(ClientResponse.class);	
		%>
	</body>
</html>