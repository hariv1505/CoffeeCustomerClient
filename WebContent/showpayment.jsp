<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Customer - Show Payment</title>
	</head>
	<body>
		<i>Payment Id</i>: ${payment.id}<br>
		<i>Payment Type</i>: ${payment.payType}<br>
		<i>Card Details</i>: ${payment.cardDetails}<br>
		<i>Amount</i>: ${payment.amount}<br>
		<%
			//int id = 0;		//get this from "id" parameter of GET request
			//ClientResponse response = service.path("rest").path("orders")
			//.path(o.getId()).accept(MediaType.APPLICATION_XML).put(ClientResponse.class);	
		%>
	</body>
</html>