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
<title>All Recent Products</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">

.crd-ho:hover{
background-color: #b2ebe9;
}


</style>
</head>
<body style="background-color: #f5dcf4;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			
			<%
	  ProductDAOImpl  dao = new ProductDAOImpl(DBConnect.getConn());
	  List<ProductDtls> list =dao.getAllOldProduct();
	  for(ProductDtls b: list)
	  {%>
		  <div class="col-md-3">
		  <div class="card crd-ho">
	     <div class="card-body text-center">
	     <img alt=" " src=" product/<%=b.getPhotoName() %>"  style="width:150px; height:150px" class="img.thumblin">
	     <p><%=b.getProductName() %></p>
	     <p><%=b.getDescription() %></p>
	     <p>Categories: <%=b.getProductCategoty() %></p>
	     
	     <div class="row">
	     <!--  <a href=" "  class="btn btn-danger btn-sm ml-2"> <i class="fas fa-cart-plus"></i>Add Cart</a> -->
	     <a href="view_products.jsp?bid=<%=b.getProductId() %> " class="btn btn-success btn-sm ml-5"> View Details</a>
	     <a href=" "  class="btn btn-danger btn-sm "> <%=b.getPrice() %><i class="fas fa-rupee-sign"></i></a>
	     </div>
	     </div>
	     </div>
		 </div> 
		  
	  <% 
	  }
	  %>
	  
			</div>
	</div>
</body>
</html>