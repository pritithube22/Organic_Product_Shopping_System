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
<title>Admin: All Products</title>
<%@include file="allCss.jsp"%>

<style>
      img.background {
      position: absolute;
      left: 0px;
      top: 0px;
      z-index: -1;
      width: 100%;
      height: 100%;
      -webkit-filter: blur(5px); /* Safari 6.0 - 9.0 */
      filter: blur(5px);
      }
    </style>

</head>

<!-- <body> -->

<body style="background-color: #f5dcf4;">   
   <img class="background" src="img/b1.jpeg">
<%@include file="navbar.jsp"%>

<c:if test="${empty userobj }">
    <c:redirect url="../login.jsp" />
    </c:if>

<h3 class="text-center">Hello Admin</h3>

 <c:if test="${not empty succMsg }">
        <h5 class="text-center text-success">${succMsg }</h5>
        <c:remove var="succMsg"  scope="session"/>
        </c:if>
        
        <c:if test="${not empty failedMsg }">
        <h5 class="text-center text-danger">${failedMsg }</h5>
        <c:remove var="failedMsg"  scope="session"/>
        </c:if>


<table class="table table-striped ">
  <thead  class="bg-primary text-white">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Image</th>
      <th scope="col">Product Name</th>
      <th scope="col">Description</th>
      <th scope="col">Price</th>
       <th scope="col">Category</th>
        <th scope="col">Status</th>
         <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
    ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
    List<ProductDtls> list = dao.getAllProducts();
  
    for(ProductDtls b: list)
    {  %>
    <tr>
      <td><%= b.getProductId() %></td>
      <td> <img src="../product/<%=b.getPhotoName()%>" style="width: 60px; height: 60px;"></td>
      <td><%= b.getProductName() %></td>
      <td><%= b.getDescription() %></td>
      <td><%= b.getPrice() %></td>
      <td><%= b.getProductCategoty()%></td>
      <td><%= b.getStatus()%></td>
      <td>
      <a href="edit_products.jsp?id=<%=b.getProductId()%>" 
      class="btn btn-sm btn-primary"><i class="fas fa-edit"></i>Edit</a>
      <a href="../delete?id=<%=b.getProductId() %>" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i>Delete</a>
      </td>
      
    </tr>
     <%  
     }
     %>
  
  
   
   
    
  </tbody>
</table>

	<div style="margin-top: 250px;">
<%@include file="footer.jsp" %>
</div>
</body>
</html>