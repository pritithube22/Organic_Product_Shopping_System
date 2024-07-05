<%@ page import="java.lang.*"%>
<%@ page import="com.DAO.*"%>
<%@ page import="com.DB.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.entity.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view products</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f5dcf4;">
	<%@include file="all_component/navbar.jsp"%>
	
	<%
	int bid=Integer.parseInt(request.getParameter("bid"));
	ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
	ProductDtls b=dao.getProductById(bid);
	
	%>
	
	<div class="container p-3">
		<div class="row p-6">
		
			<div class="col-md-6 text-center p-5 border bg-white">        
			<img src="product/<%=b.getPhotoName() %>" style="height:200px;width: 200px"><br>
			<h4 class="mt-3">Product Name: <span class="text-success"><%=b.getProductName() %></span> </h4>
			<h4>Description:<span class="text-success"> <%=b.getDescription() %></span></h4>
			<h4>Category:<span class="text-success"> Fruit <!--  <%=b.getProductCategoty()%> --></span></h4>
			</div>
			
		<!--  -->  	<div class="col-md-6 text-center p-5 border bg-white ">
			<h2><%=b.getProductName() %></h2>
			
			<%
			if("old".equals(b.getProductCategoty()))
			{%>
			
			<h5 class="text-primary">Contact To Seller</h5>
			<h5 class="text-primary"><i class="fas fa-envelope"></i>Email: admin@gmail.com</h5>
			
			<% } %>
			
			
			
			<div class="row " >
			<div class="col-md-4 text-success text-center p-2">
			<i class="fas fa-money-bill-wave fa-2x"></i>
			<p>Cash On Delivery</p>
			</div>
			
			<div class="col-md-4 text-success text-center p-2">
			<i class="fas fa-caret-square-right fa-2x"></i>
			<p>Organic</p>
			</div>
			
			<div class="col-md-4 text-success text-center p-2">
			<i class="fas fa-truck fa-2x"></i>
			<p>Free Shipping</p>
			</div>
			</div>
			
			<%
			if("old".equals(b.getProductCategoty()))
			{%>
			
			<div class=" text-center p-3">
			<a href="index.jsp" class="btn btn-success"><i class="fas fa-cart-plus"></i>Continue Shopping</a>
			<a href="" class="btn btn-danger"><i class="fas fa-rupee-sign"></i>200</a>
			</div>
			
			<%
			}else{%>
			
			<div class=" text-center p-3">
			<a href="" class="btn btn-primary"><i class="fab fa-pagelines"></i>Pure Organic</a>
			<a href="" class="btn btn-danger">Chemical Free</a>
			</div>
				
			<%}
			%>
			
			
			
			</div> <!-- -->
			
		</div>
	</div>
</body>
</html>