<%@page import="java.util.*"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.postDao"%>

<%@page import="com.tech.blog.entities.*"%>
<%@page import="com.tech.blog.dao.userDao"%>
<%@page import="com.tech.blog.dao.likeDao"%>
<div class="row">

	<%
	postDao d = new postDao(ConnectionProvider.getConnection());
	List<Posts>list=new ArrayList<>();
	int cid=Integer.parseInt(request.getParameter("cid"));
	if(cid==0)
	{

		 list = d.getAllPosts();
	}else
	{
		list=d.getAllPostsById(cid);
	}
	
	if(list.size()==0)
	{
		out.println("<h3 class='display-3 text-center'>No Posts in This Category</h3>");
		return;
	}
	for (Posts p : list) {
	%>
	<div class="col-md-6   mt-2">
		<div class="card">
			<img class="card-img-top "  height="200"  width="50" src="blog_pic/<%=p.getpPic()%>"
				alt="Card image cap">
			<div class="card-body">
				<b><%=p.getpTitle()%></b>
				<p><%=p.getpContent()%></p>
				
			

			</div>
			<div class="card-footer   primary-background text-center">
			<a href="showBlogPage.jsp?postId=<%=p.getPid() %>"  class="btn btn-outline-light btn-sm">Read more</a>
		
<%
likeDao ld=new likeDao(ConnectionProvider.getConnection());
int c=ld.countLike(p.getPid());

user u = (user) session.getAttribute("currentUser");
%>
			<a href=""   onclick="doLike(<%=p.getPid() %>,<%=u.getId() %>)"  class="btn btn-outline-light  btn-sm"><i class="   fa fa-thumbs-o-up"></i><span class="like-counter"><%=c %></span></a>
			<a href=""  class="btn btn-outline-light  btn-sm"><i class="fa fa-commenting-o"></i><span>10</span></a>
			
			
			</div>
		</div>
	</div>


	<%
	
}
%>
</div>