<%@ page import="java.lang.*" %>
<%@ page import="com.DAO.*" %>
<%@ page import="com.DB.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"   %>
<!DOCTYPE html>



<html>
<head>
<meta charset="UTF-8">
<title>OrganicProducts Index Page</title>

<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img{
background: url("img/FruitVegetables1.jpg");
height: 50vh;
width: 100%;

background-size: cover;
backgroud-repeat: no-repeat;
}
.crd-ho:hover{
background-color: #b2ebe9;
}


</style>

</head>



<body  style="background-color: #f5dcf4;">

<%
   User u = (User)session.getAttribute("userobj");

%>

	<%@include file="all_component/navbar.jsp" %>
	
	<div class="container-fluid back-img">
	<h2 class="text-center text-white"><i class="fab fa-pagelines"></i>Organic Product Shopping System</h2>
	
	
 
	<%-- <%   Connection conn = DBConnect.getConn(); 
	   out.println(conn); 
	%> --%>
	
	</div>
	
	<!-- Start Recent Product -->
	
	<div class="container ">
	  <h3 class="text-center">Recent Product </h3>
	  <div class="row">
	  
	  <%
	  ProductDAOImpl dao2 = new ProductDAOImpl(DBConnect.getConn());
	  List<ProductDtls> list2 =  dao2.getRecentProduct();
	  for(ProductDtls b: list2)
	  {
	  %>
		 
		<div class="col-md-3">
	     <div class="card crd-ho ">
	     <div class="card-body text-center">
	     <img alt=" " src=" product/<%=b.getPhotoName() %>"  style="width:200px; height:200px" class="img.thumblin">
	     <p><%=b.getProductName() %></p>
	     <p> <%=b.getDescription() %></p>
	     
	     <p>
	     <%
	     if(b.getProductCategoty().equals("old"))
	     {%>
	    
	    Categories: <%=b.getProductCategoty() %></p>
	     <div class="row">
	     <a href=" view_products.jsp?bid=<%=b.getProductId() %>"  class="btn btn-info btn-sm ml-5"> View Details</a>
	     <a href=" "  class="btn btn-warning btn-sm ml-1"> <%=b.getPrice() %><i class="fas fa-rupee-sign"></i> /Kg</a>
	     </div>
	    	 
	     <%
	     }else{ %>
	    
	    Categories: fruit <!--  <%=b.getProductCategoty() %> --></p> 
	     <div class="row">
	     
	     <%if(u==null)
	    	 {%>
	    	 <a href="login.jsp "  class="btn btn-warning btn-sm ml-2"> <i class="fas fa-cart-plus"></i><!-- Add Cart --></a>
	    	 <%
	    	 }else{%>
	    	<a href="cart?bid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"  class="btn btn-warning btn-sm ml-2"> <i class="fas fa-cart-plus"></i><!-- Add Cart --></a>	 
	    		 
	    	<% }%> 
	     
	
	     <a href="view_products.jsp?bid=<%=b.getProductId() %> "  class="btn btn-info btn-sm ml-1"> View Details</a>
	     <a href=" "  class="btn btn-warning btn-sm "> <%=b.getPrice()%><i class="fas fa-rupee-sign"></i> /Kg</a>
	     </div>
	    	 
	    <% 	 
	     }
	     %>
	     
	     
	     
	     </div>
	     </div>
	     </div> 
		  
	  <%
	  }
	  %>
	  
	  
</div>
<div class="text-center  mt-1">
<a href="all_recent_product.jsp "  class="btn btn-success btn-sm text-white"> View All</a>
</div>
</div>
	<!-- End Recent Product -->
	
 <hr>

	<!-- Start new Product -->
	
	<div class="container ">
	  <h3 class="text-center">New Product </h3>
	  <div class="row">
	  
	  <%
	  ProductDAOImpl  dao = new ProductDAOImpl(DBConnect.getConn());
	  List<ProductDtls> list =dao.getNewProduct();
	  for(ProductDtls b: list)
	  {%>
		  <div class="col-md-3">
		  <div class="card crd-ho">
	     <div class="card-body text-center">
	     <img alt=" " src=" product/<%=b.getPhotoName() %>"  style="width:200px; height:200px" class="img.thumblin">
	     <p><%=b.getProductName() %></p>
	     <p><%=b.getDescription() %></p>
	     <p>Categories: fruit <!--  <%=b.getProductCategoty() %> --></p>
	     
	     <div class="row">
	     <%if(u==null)
	    	 {%>
	    	 <a href="login.jsp "  class="btn btn-warning btn-sm ml-2"> <i class="fas fa-cart-plus"></i><!-- Add Cart --></a>
	    	 <%
	    	 }else{%>
	    	<a href="cart?bid=<%=b.getProductId()%>&&uid=<%=u.getId()%>"  class="btn btn-warning btn-sm ml-2"> <i class="fas fa-cart-plus"></i><!-- Add Cart --></a>	 
	    		 
	    	<% }%> 
	         
	     <a href="view_products.jsp?bid=<%=b.getProductId() %> "  class="btn btn-info btn-sm ml-1"> View Details</a>
	     
	     <a href=" "  class="btn btn-warning btn-sm "> <%=b.getPrice() %><i class="fas fa-rupee-sign"></i> /Kg</a>
	     </div>
	     </div>
	     </div>
		 </div> 
		  
	  <% 
	  }
	  %>
	  
	    
</div>
<div class="text-center  mt-1">
<a href=" all_new_product.jsp"  class="btn btn-success btn-sm text-white"> View All</a>
</div>
</div>
	<!-- End new Product -->
<hr>	


	<!-- Start old Product -->
	
	<!--  
 	
	<div class="container ">
	  <h3 class="text-center">Old Product </h3>
	  <div class="row">
	  
	   <%
	  ProductDAOImpl dao3 = new ProductDAOImpl(DBConnect.getConn());
	  List<ProductDtls> list3 =  dao3.getOldProduct();
	  for(ProductDtls b: list3)
	  {
	  %>
		 
		<div class="col-md-3">
	     <div class="card crd-ho">
	     <div class="card-body text-center">
	     <img alt=" " src=" product/<%=b.getPhotoName() %>"  style="width:200px; height:200px" class="img.thumblin">
	     <p><%=b.getProductName() %></p>
	     <p> <%=b.getDescription() %></p>
	     
	     <p> <%=b.getProductCategoty() %> </p>
	     
	     <div class="row">
	     <a href="view_products.jsp?bid=<%=b.getProductId() %> "  class="btn btn-info btn-sm ml-5"> View Details</a>
	     <a href=" "  class="btn btn-warning btn-sm "> <%=b.getPrice() %><i class="fas fa-rupee-sign"></i> /Kg</a>
	     </div>
	     
	     </div>
	     </div>
	     </div> 
		  
	  <%
	  }
	  %>
	 
	  
</div>
<div class="text-center  mt-1">
<a href=" all_old_product.jsp"  class="btn btn-success btn-sm text-white"> View All</a>
</div>
</div>  
-->
	<!-- End old Product -->	
	
	<%@include file="all_component/footer.jsp" %>
	
</body>
</html>