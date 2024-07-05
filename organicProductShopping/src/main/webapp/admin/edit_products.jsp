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
<title>Admin: Add Products</title>
<%@include file="allCss.jsp"%>



</head>

<body style="background-color: #f5dcf4;">  



	<%@include file="navbar.jsp"%>
      <div class="container">
      <div class="row">
      <div class="col-md-4 offset-md-4">
      <div class="card">
      <div class="card-body">
         
        <h4 class="text-center">Edit Products</h4> 
        
       <%
          int id = Integer.parseInt(request.getParameter("id"));
          ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
          ProductDtls b = dao.getProductById(id);
          
       
       %> 
        
         
      <form action="../editproducts"  method="post">
           
           <input type="hidden" name ="id" value="<%=b.getProductId()%>">
           
           <div class="form-group">
           <label for="exampleInputEmail1"> Product Name*</label>  <input 
           name="bname" type ="text"  class="form-control"
           id = "exampleInputEmail1" aria-describedby="emailHelp" value="<%=b.getProductName()%>">
            </div>
            
             <div class="form-group">
           <label for="exampleInputEmail1"> Description*</label>  <input 
           name="desc" type ="text"  class="form-control"
           id = "exampleInputEmail1" aria-describedby="emailHelp" value="<%=b.getDescription()%>">
            </div>
            
             <div class="form-group">
           <label for="exampleInputEmail1"> Price*</label>  <input 
           name="price" type ="number"  class="form-control"
           id = "exampleInputPassword"  value="<%=b.getPrice()%>">
            </div>
            
             
            
            
             <div class="form-group">
           <label for="inputState"> Product Status</label>  <select 
           id="inputState" name="status" class="form-control">
           <% 
           if("Active".equals(b.getStatus())) { 
           %>
        	  <option value="Active">Active</option>
        	  <option value="Inactive">Inactive</option> 
        	   
          <% 
          }else{  
          %>
          <option value="Inactive">Inactive</option>
          <option value="Active">Active</option>
        <%
        }
        %>
           
          </select>
            </div>
            
            
            
      <button type="submit"  class="btn btn-primary"> Update </button>
      
      </form>
      
      </div>
      </div>
      </div>
      </div>
      </div>

	<div style="margin-top: 40px;">
<%@include file="footer.jsp" %>
</div>
</body>
</html>