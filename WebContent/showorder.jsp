<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<i>Details</i>: ${order.detail}<br>
		<%
			//int id = 0;		//get this from "id" parameter of GET request
			//ClientResponse response = service.path("rest").path("orders")
			//.path(o.getId()).accept(MediaType.APPLICATION_XML).put(ClientResponse.class);	
		%>
	</body>
</html>