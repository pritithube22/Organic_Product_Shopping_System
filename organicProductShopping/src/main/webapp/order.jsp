<%@ page import="java.lang.*" %>
<%@ page import="com.DAO.*" %>
<%@ page import="com.DB.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order page</title>
<%@include file="all_component/allCss.jsp"%>
</head>

<body style="background-color: #f5dcf4;">
	<%@include file="all_component/navbar.jsp"%>
	
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp">
		</c:redirect>
	</c:if>
	
	<div class="container">
	<h3 class="text-center text-success mt-2">Your Order</h3>
	
	<table class="table table-striped mt-5">
  <thead class="bg-success text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Product Name</th>
      <th scope="col">Description</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  User u =(User)session.getAttribute("userobj");
  ProductOrderImpl dao = new ProductOrderImpl(DBConnect.getConn());
  List<Product_Order> blist = dao.getProduct(u.getEmail());
  for(Product_Order b: blist)
  {%>
	
	<tr>
      <th scope="row"><%=b.getOrderId()%></th>
      <td><%=b.getUsername()%></td>
      <td><%=b.getProductName()%></td>
      <td><%=b.getDescription()%></td>
      <td><%=b.getPrice()%></td>
      <td><%=b.getPaymentType()%></td>
    </tr>
	  
  <% }
  
  %>
  
    
   
  </tbody>
</table>
	
	</div>

</body>
</html>