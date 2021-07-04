<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup Here</title>

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

</style>
</head>
<body>

	<%@include file="navbar.jsp"%>


	<main
		class="d-flex align-items-center   primary-background   banner-background"
		style=" padding-bottom: 80px; height: 70vh">
		<div class="container">
			<div class="row">

				<div class="col-md-6  offset-md-3">
					<div class="card">
						<div
							class="card-header   primary-background text-white text-center">
							<br><br>
							</a><span class="fa fa-user-circle fa-3x"> </span>
							<p>Signup Here</p>
						</div>
						<div class="card-body">
							<form id="reg-form" action="registerServlet"   method="post">
								<div class="form-group">
									<label for="user_name">User Name</label> <input name="user_name" type="text"
										class="form-control" id="user_name"
										aria-describedby="emailHelp" placeholder="Enter user name">

								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input name="mail"
										type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email">

								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input name="password"
										type="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>
								
								<div class="form-group">
									<label for="gender">Select Gender</label> 
									<br>
									<input type="radio"    name="gender" id="gender"   value="male">Male 
										<input type="radio" id="gender "   name="gender"   value="female">Female

								</div>
								<div class="form-group"  >
							
								<textarea name="about" placeholder ="	Enter About Yourself" class="form-control"   rows="2" ></textarea>
								
								</div>
								<div class="form-check">
								
								
									<input name="check" type="checkbox" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">Agree Terms And Condition</label>
								</div >
								<div  id="loader"  style="display:none;" "class="container  text-center">
								<span class="fa fa-refresh   fa-spin  fa-4x">
								
								</span>
								<h1>please wait</h1>
								<p id="msg"></p>
								</div>
								<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
								
							</form>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</main>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			console.log("page is ready");
			
			$("#reg-form").on('submit',function(event){
				
				event.preventDefault();
			//	var f=$(this).serialize();
			let f=new FormData(this);
				console.log(f);
				$("#submit-btn").hide();
				$("#loader").show();
				
				
var ty="registerServlet";
				$.ajax({
					url :ty,
					data:f,
					type:'POST',
					success:  function(data,textStatus,jqXHR){
						console.log(data);
						console.log("success.......................");
						$("#submit-btn").show();
						$("#loader").hide();
						
						if(data.trim()==='done')
						{
							swal("Successfully Registered!", "!", "success").then((value)=>
							{
								window.location="login.jsp"
							});
						
						}
					else
						{
						swal(data);

						}
					},
				error:     function(jqXHR,textStatus,errorThrown){
					console.log(data);
					console.log("error.......................");
					$("#submit-btn").show();
					$("#loader").hide();
					swal("error!!!!", "!", "fail");

				},
				processData:false,
				contentType:false,
				})
			})
		})
	</script>
</body>
</html>