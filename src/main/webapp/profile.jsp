
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.tech.blog.entities.*"%>
<%@page errorPage="error.jsp"%>
<%
user u=(user)session.getAttribute("currentUser");
if(u==null)
{
	 	response.sendRedirect("login.jsp");
}
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
				<li class="nav-item active"><a class="nav-link" href="#"> <span
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
						<span class="fa fa-envelope-o	
        "></span> Contact
				</a></li>
				

			</ul>
			<ul class="navbar-nav  mr-right">
			
				<li class="nav-item  active"><a class="nav-link" href="#!"   data-toggle="modal" data-target="#prrofile-modal">
						<span class="fa  fa-user-circle"></span> <%=u.getName()%></a>
				</li>
				<li class="nav-item   active">
				<a class="nav-link" href="logoutServlet">
						<span class="fa  fa fa-sign-out	
                "></span> LogOut</a>
                </li>
                
			
			</ul>
		</div>
	</nav>



		<%
				message m=(message)session.getAttribute("msg");
				if(m!=null)
				{
					%>
					
					<div class="alert  <%=m.getCssClass() %>" role="alert">
<%= m.getContent() %>
</div>
					<%
					session.removeAttribute("msg");
				}
				%>
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="prrofile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header  primary-background text-white   text-center" >
        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div  class="container  text-center" >
       <img class="img-fluid  "  style="border-radius:50%; max-width:150px;"" alt="" src="img/<%=u.getImage()%>">
        
        <h5 class="modal-title  mt-3" id="exampleModalLabel"><%=u.getName() %></h5>
      
        <div id="profile-details">
     <table class="table">

  <tbody>
    <tr>
      <th scope="row">ID:</th>
      <td><%=u.getId() %></td>
    </tr>
    <tr>
      <th scope="row">Email</th>
      <td><%=u.getEmail() %></td>
    </tr>
    <tr>
      <th scope="row">Gender</th>
      <td><%=u.getGender() %></td>
    </tr> 
    <tr>
      <th scope="row">Status</th>
      <td><%=u.getAbout() %></td>
    </tr><tr>
      <th scope="row">Registered Date</th>
      <td><%=u.getDateTime() %></td>
    </tr>
  </tbody>
</table>
</div>
<div id="profile-edit"  style="display:none;">
<h3 class="mt-2">Please Edit Carefully!!</h3>
<form action="editServlet"   method="post"   enctype="multipart/form-data">
 <table class="table">

  <tbody>
    <tr>
      <th scope="row">ID:</th>
      <td><%=u.getId() %></td>
    </tr>
        <tr>
      <th scope="row">Name</th>
      <td> <input type="text"  class="form-control" name="name"  value="<%=u.getName()%>"> </td>
    </tr>
    
        <tr>
      <th scope="row">Email</th>
      <td> <input type="email"  class="form-control" name="mail"  value="<%=u.getEmail()%>"> </td>
    </tr>
    
    
      <th scope="row">Password</th>
      <td> <input type="password"  class="form-control" name="password"  value="<%=u.getPassword()%>"> </td>
    </tr>
      <tr>
      <th scope="row">Gender</th>
      <td><%=u.getGender().toUpperCase() %></td>
    </tr>       <tr>
      <th scope="row">About</th>
   <td>
      <textarea name="about" placeholder ="" class="form-control"   rows="2" ><%=u.getAbout() %></textarea>
		
   </td>
    </tr>  <tr>
      <th scope="row">New Profile</th>
   <td>
   <input type="file"   name="image" class="form-control">	
   </td>
    </tr> 
    							
  </tbody>
</table>
<div class="container">
<button type="submit"   class="btn btn-outline-primary">Save</button>
</div>
</form>
</div>

       </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile" type="button" class="btn btn-primary">Edit</button>
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
</body>
</html>