<%@ page import="java.lang.*" %>
<%@ page import="com.DAO.*" %>
<%@ page import="com.DB.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f5dcf4;"> 

<c:if test="${empty userobj }">
    <c:redirect url="../login.jsp" />
    </c:if>

<%@include file="navbar.jsp"%>

<h3 class="text-center">Hello Admin</h3>

<table class="table table-striped ">
  <thead  class="bg-success text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col"> Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
       <th scope="col">Ph No</th>
        <th scope="col">Product Name</th>
         <th scope="col">Description</th>
         <th scope="col">Price</th>
         <th scope="col">Payment type</th>
    </tr>
  </thead>
  <tbody>
  <%
  ProductOrderImpl dao = new ProductOrderImpl(DBConnect.getConn());
  List<Product_Order> blist =  dao.getAllOrder();
  for(Product_Order b: blist)
  {%> 
	
	<tr>
      <th scope="row"><%=b.getOrderId()%></th>
      <td><%=b.getUsername()%></td>
      <td><%=b.getEmail()%></td>
      <td><%=b.getFullAdd()%></td>
      <td><%=b.getPhno()%></td>
      <td><%=b.getProductName()%></td>
      <td><%=b.getDescription()%></td>
      <td><%=b.getPrice()%></td>
      <td><%=b.getPaymentType()%></td>
      
    </tr>
	  
  <%}
  
  %>
    
    
    
  </tbody>
</table>

	<div style="margin-top: 250px;">

</div>
</body>
</html>