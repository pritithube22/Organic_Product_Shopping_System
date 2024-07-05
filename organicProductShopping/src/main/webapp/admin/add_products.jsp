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
	
	<c:if test="${empty userobj }">
    <c:redirect url="../login.jsp" />
    </c:if>
	
      <div class="container">
      <div class="row">
      <div class="col-md-4 offset-md-4">
      <div class="card">
      <div class="card-body">
         
        <h4 class="text-center">Add Products</h4> 
        
        <c:if test="${not empty succMsg }">
        <p class="text-center text-success">${succMsg }</p>
        <c:remove var="succMsg"  scope="session"/>
        </c:if>
        
        <c:if test="${not empty failedMsg }">
        <p class="text-center text-danger">${failedMsg }</p>
        <c:remove var="failedMsg"  scope="session"/>
        </c:if>
        
         
      <form action="../add_products"  method="post"
           enctype="multipart/form-data">
           
           <div class="form-group">
           <label for="exampleInputEmail1"> Product Name*</label>  <input 
           name="bname" type ="text"  class="form-control"
           id = "exampleInputEmail1" aria-describedby="emailHelp">
            </div>
            
             <div class="form-group">
           <label for="exampleInputEmail1"> Description*</label>  <input 
           name="desc" type ="text"  class="form-control"
           id = "exampleInputEmail1" aria-describedby="emailHelp">
            </div>
            
             <div class="form-group">
           <label for="exampleInputEmail1"> Price*</label>  <input 
           name="price" type ="number"  class="form-control"
           id = "exampleInputEmail1" >
            </div>
            
             <div class="form-group">
           <label for="inputState"> Product Categories</label>  <select 
           id="inputState" name="Categories" class="form-control">
           <option selected>--select--</option>
           <option value="new">New Product</option>
           </select>
            </div>
            
            
             <div class="form-group">
           <label for="inputState"> Product Status</label>  <select 
           id="inputState" name="status" class="form-control">
           <option selected>--select--</option>
           <option value="Active">Active</option>
           <option value="Inactive">Inactive</option>
           </select>
            </div>
            
            <div class="form-group">
            <label for="exampleFormControlFile1">Upload Photo</label> <input
             name="bimg" type="file" class="form-control-file" 
             id ="exampleFormControlFile1">
            </div>
            
      <button type="submit"  class="btn btn-primary"> Add </button>
      
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