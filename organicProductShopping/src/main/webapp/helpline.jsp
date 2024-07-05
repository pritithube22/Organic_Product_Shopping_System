<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>help line page</title>
<%@include file="all_component/allCss.jsp"%>

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

<body  >  
   <img class="background" src="img/b1.jpeg">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4 text-center">
			<div class="text-success ">
				<i class="fas fa-address-card fa-3x"></i>
				</div>
				<h3 class="text-white">24 X 7 Service</h3>
				<h4 class="text-white">Email And HelpLine Number</h4>
				<h5 class="text-white">  organicProducts2002@gmail.com</h5>
				<h5 class="text-white">  +9988779988</h5>
				
				<a href="index.jsp" class="btn btn-primary">Home</a>
			</div>
		</div>
	</div>
</body>
</html>