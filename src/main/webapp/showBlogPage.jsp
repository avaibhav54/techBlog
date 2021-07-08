

<%@page import="com.tech.blog.dao.likeDao"%>
<%@page import="com.tech.blog.dao.userDao"%>
<%@page isErrorPage="true"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.postDao"%>
<%@page import="java.util.*"%>
<%@page import="com.tech.blog.entities.*"%>
<%@page errorPage="error.jsp"%>
<%
user u = (user) session.getAttribute("currentUser");
if (u == null) {
	response.sendRedirect("login.jsp");
}
%>

<%
int post_id = Integer.parseInt(request.getParameter("postId"));

postDao p = new postDao(ConnectionProvider.getConnection());
Posts po = p.getAllPostsByPostId(post_id);
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/hi_IN/sdk.js#xfbml=1&version=v11.0" nonce="OY7snRNR"></script>

<title><%=po.getpTitle()%></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">


.post-title
{
font-weight:100;
	font-size:30px;
}

.post-content
{
font-weight:100;
	font-size:25px;
}
.post-date
{
font-style:italic;
font-weight:bold;
}
.user-info
{

	font-size:20px;
}

.row-user
{
border:1px solid 	#e2e2e2;
padding-top:15px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"><span
			class="	fa fa-asterisk"></span>TechBlog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="profile.jsp"> <span
						class="fa fa-comments	
        "></span> Vaibhav <span
						class="sr-only">(current)</span></a></li>

				<li class="nav-item  active dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Project Implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure And Algorithm</a>
					</div></li>
				<li class="nav-item  active"><a class="nav-link" href="#">
						<span class="fa fa-address-card-o	
        "></span> Contact
				</a></li>

				<li class="nav-item  active"><a data-toggle="modal"
					data-target="#add-post-modal" class="nav-link" href="#"> <span
						class="fa fa-asterisk        "></span> Do Post
				</a></li>


			</ul>
			<ul class="navbar-nav  mr-right">

				<li class="nav-item  active"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#prrofile-modal"> <span
						class="fa  fa-user-circle"></span> <%=u.getName()%></a></li>
				<li class="nav-item   active"><a class="nav-link"
					href="logoutServlet"> <span
						class="fa  fa fa-sign-out	
                "></span> LogOut
				</a></li>


			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row  my-4">
			<div class="col-md-8  offset-md-2">
				<div class="card">
					<div class="card-header   primary-background text-white">
						<h4 class="post-title"><%=po.getpTitle()%></h4>
					</div>
					<div class="card-body">
					<img class="my-2 card-img-top "   src="blog_pic/<%=po.getpPic()%>"
				alt="Card image cap">
			<%
			int yu=po.getUid();
			userDao uy=new userDao(ConnectionProvider.getConnection());
			String uname=uy.getUserById(yu);
			%>
					<div class="row   my-3    row-user">
					<div class="col-md-8">
					<p class="user-info"><a href="#"> <%= uname%> </a>has posted</p>
					</div>
					<div class="col-md-4">
					<p class="post-date"><%=po.getpDate().toLocaleString() %></p>
					</div>
					</div>
					<p class="post-content"><%=po.getpContent() %></p>
					<br>
					<br>
					
					<div class="post-code">
					<pre><%=po.getpCode() %></pre>
					</div>
						<%
				if (!po.getGithub().equals("#")) {
				%>

				<a href="<%=po.getGithub()%>">See on Github</a>
				<%
				}
				%>
					
					</div>
<div class="card-footer   primary-background text-center">
<%
likeDao ld=new likeDao(ConnectionProvider.getConnection());
int cou=ld.countLike(po.getPid());
%>
			<a href=""   onclick="doLike(<%=po.getPid() %>,<%=u.getId() %>)"  class="btn btn-outline-light  btn-sm"><i class="   fa fa-thumbs-o-up"></i><span class="like-counter"><%=cou %></span></a>
			<a href=""  class="btn btn-outline-light  btn-sm"><i class="fa fa-commenting-o"></i><span>10</span></a>
			
			
			</div>
			
			<div class="card-footer">
			<div class="fb-comments" data-href="http://localhost:8080/TechBlog/showBlogPage.jsp?postId=<%=po.getPid() %>" data-width="" data-numposts="5"></div>
			
			</div>

				</div>


			</div>


		</div>


	</div>


	<!-- Modal -->
	<div class="modal fade" id="prrofile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div
					class="modal-header  primary-background text-white   text-center">
					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container  text-center">
						<img class="img-fluid  "
							style="border-radius: 50%; max-width: 150px;" " alt=""
							src="img/<%=u.getImage()%>">

						<h5 class="modal-title  mt-3" id="exampleModalLabel"><%=u.getName()%></h5>

						<div id="profile-details">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID:</th>
										<td><%=u.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Email</th>
										<td><%=u.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">Gender</th>
										<td><%=u.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">Status</th>
										<td><%=u.getAbout()%></td>
									</tr>
									<tr>
										<th scope="row">Registered Date</th>
										<td><%=u.getDateTime()%></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div id="profile-edit" style="display: none;">
							<h3 class="mt-2">Please Edit Carefully!!</h3>
							<form action="editServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">

									<tbody>
										<tr>
											<th scope="row">ID:</th>
											<td><%=u.getId()%></td>
										</tr>
										<tr>
											<th scope="row">Name</th>
											<td><input type="text" class="form-control" name="name"
												value="<%=u.getName()%>"></td>
										</tr>

										<tr>
											<th scope="row">Email</th>
											<td><input type="email" class="form-control" name="mail"
												value="<%=u.getEmail()%>"></td>
										</tr>


										<th scope="row">Password</th>
										<td><input type="password" class="form-control"
											name="password" value="<%=u.getPassword()%>"></td>
										</tr>
										<tr>
											<th scope="row">Gender</th>
											<td><%=u.getGender().toUpperCase()%></td>
										</tr>
										<tr>
											<th scope="row">About</th>
											<td><textarea name="about" placeholder=""
													class="form-control" rows="2"><%=u.getAbout()%></textarea>

											</td>
										</tr>
										<tr>
											<th scope="row">New Profile</th>
											<td><input type="file" name="image" class="form-control">
											</td>
										</tr>

									</tbody>
								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>
							</form>
						</div>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile" type="button" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>



	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div
					class="modal-header   primary-background text-white   text-center">
					<h5 class="modal-title   " id="exampleModalLabel">Provide The
						Post Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" action="postServlet" method="post">
						<div class="form-group">
							<select name="cid" class="form-control">
								<option selected disabled>Select Category</option>

								<%
								postDao postd = new postDao(ConnectionProvider.getConnection());
								ArrayList<category> list = postd.getAllCategories();
								for (category c : list) {
								%>


								<option value=<%=c.getId()%>><%=c.getName()%></option>
								<%
								}
								%>

							</select>
						</div>
						<div class="form-group">
							<input name="title" type="text" placeholder="Enter Post Title"
								class="form-control">
						</div>
						<div class="form-group">
							<textarea name="content" class="form-control"
								placeholder="Enter content" rows="5" cols=""></textarea>
						</div>
						<div class="form-group">
							<textarea name="code" class="form-control"
								placeholder="Enter  Your Program (if any)" rows="5" cols=""></textarea>
						</div>
						<div class="form-group">
							<input name=github type="text" placeholder="Github Link()"
								class="form-control">
						</div>
						<div class="form-group">
							<label> Select Picture</label> <br> <input type="file"
								name="pic">
						</div>
						<div class="container   text-center">
							<button type="submit" class="btn btn-outline-primary">Post</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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

	<script type="text/javascript">
	$(document).ready(function()
	{

		let editStatus=false;
		$('#edit-profile').click(function(){
			console.log(editStatus);
if(editStatus==false)
	{
			$('#profile-details').hide();
			$('#profile-edit').show();
			editStatus=true;
			$(this).text("Back");
			
	}
else
	{
	$('#profile-details').show();
	$('#profile-edit').hide();

	$(this).text("Edit");
	editStatus=false;
	}
		})
	});
	
	</script>


	<!--  now add post !-->
	<script type="text/javascript">
	$(document).ready(function(e)
			
	{
		$("#add-post-form").on("submit",function(event){
			console.log("chkng")
			event.preventDefault();
			let form=new FormData(this);
			$.ajax(
			{
				url:"postServlet",
				type:'POST',
				data:form,
				success:  function(data,textStatus,jqXHR){
					console.log(data);
					console.log("success.......................");
			
					if(data.trim()==='success')
					{
						swal("Successfully Added!", "!", "success").then((value)=>
						{
							window.location="profile.jsp"
						});
					
					}
				else
					{
					swal(data);

					swal("error!!!!", "!", "fail");
					}
				},
			error:     function(jqXHR,textStatus,errorThrown){
				console.log(data);
				console.log("error.......................");
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