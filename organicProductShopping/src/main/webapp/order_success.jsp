<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order success</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f5dcf4;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container text-center mt-3">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>Your Order Placed Successfully</h2>
		<h5>within 24 Hours Your product is delivered to you</h5>
		<a href="index.jsp" class="btn btn-primary mt-3 text-white">Home</a> <a
			href="order.jsp" class="btn btn-warning mt-3 text-white">View Order</a>
	</div>

</body>
</html>