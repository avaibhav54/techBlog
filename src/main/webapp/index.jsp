<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
	.banner-background
	{
clip-path: polygon(50% 0%, 100% 0, 100% 86%, 71% 96%, 15% 90%, 0 96%, 0 1%);
	
	}
	</style>

</head>
<body>
hello 
	<%@include file="navbar.jsp"%>

	<div class="container-fluid   m-0 p-0">
		<div class="jumbotron   primary-background   banner-background text-white">
			<div class="container"   >
				<h3 class="display-3">Welcome To Tech Blog</h3>
				<p>Welcome to technical blog Java is a high-level, class-based,
					object-oriented programming language that is designed to have as
					few implementation dependencies as possible. It is a
					general-purpose programming language intended to let application
					developers write once, run anywhere (WORA),[16] meaning that
					compiled Java code can run on all platforms that support Java
					without the need for recompilation.[17] Java applications are
					typically compiled to bytecode that can run on any Java virtual
					machine (JVM) regardless of the underlying computer architecture.
					The syntax of Java is similar to C and C++</p>
				<a  href="signup.jsp" class="btn btn-outline-light  btn-lg">
					<span class="fa fa-user-circle	
		"></span> Start ! It's free
				</a>
				<a class="btn btn-outline-light  btn-lg"   href="login.jsp" >
					<span class="fa fa-user-circle-o	 fa-spin
			"></span> LogIn
				</a>

			</div>
		</div>


	</div>
	<br>
	<div class="container">
		<div class="row   mb-2" >
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#"
							class="btn btn-primary   primary-background text:white">Read
							More</a>
					</div>
				</div>
			</div>	<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#"
							class="btn btn-primary   primary-background text:white">Read
							More</a>
					</div>
				</div>
			</div>	<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#"
							class="btn btn-primary   primary-background text:white">Read
							More</a>
					</div>
				</div>
			</div>
		</div>	<div class="row">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#"
							class="btn btn-primary   primary-background text:white">Read
							More</a>
					</div>
				</div>
			</div>	<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#"
							class="btn btn-primary   primary-background text:white">Read
							More</a>
					</div>
				</div>
			</div>	<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#"
							class="btn btn-primary   primary-background text:white">Read
							More</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="js/my.js" type="text/javascript"></script>

</body>
</html>