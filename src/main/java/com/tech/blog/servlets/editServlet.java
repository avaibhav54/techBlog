package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.userDao;
import com.tech.blog.entities.message;
import com.tech.blog.entities.user;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.imageUpdater;

/**
 * Servlet implementation class editServlet
 */
@WebServlet("/editServlet")
@MultipartConfig
public class editServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
//	out.println("<h1>fkjdaskjfdkasf</h1>");
	String name=request.getParameter("name");
	String mail=request.getParameter("mail");
	String password=request.getParameter("password");
	String about=request.getParameter("about");
	Part part=request.getPart("image");
	String image_name=part.getSubmittedFileName();
//	out.println(name+" "+mail+" "+password+" "+about+" "+" "+image_name);
	HttpSession s=request.getSession();
	
	user u=(user) s.getAttribute("currentUser");
	String back=u.getImage();
	u.setAbout(about);
	u.setEmail(mail);
	u.setImage(image_name);
	u.setName(name);
	u.setPassword(password);
	userDao dao=new userDao(ConnectionProvider.getConnection());
	boolean f=dao.updateUser(u);
if(f)
{
	String path=request.getRealPath("/")+"img"+File.separator+image_name;
	
	out.println(path);
	imageUpdater iu =new imageUpdater();
	if(!back.equals("us.jpg"))
	iu.delete(request.getRealPath("/")+"img"+File.separator+back);
	iu.save(path,part.getInputStream());
	System.out.println(path);
	message ms=new message("Successfully updated Profile ","success","alert-success");
	s.setAttribute("msg",ms);
	response.sendRedirect("profile.jsp");
}
else
{
	out.println("not updated");
}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
