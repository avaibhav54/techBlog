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

import com.tech.blog.dao.postDao;
import com.tech.blog.entities.Posts;
import com.tech.blog.entities.user;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.imageUpdater;

/**
 * Servlet implementation class postServlet
 */
@WebServlet("/postServlet")
@MultipartConfig
public class postServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	PrintWriter out=response.getWriter();
	response.setContentType("text/html");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	String github=request.getParameter("github");
	String code=request.getParameter("code");
	int id=Integer.parseInt(request.getParameter("cid"));
	Part part=request.getPart("pic");
	
HttpSession s=request.getSession();
	user u=(user) s.getAttribute("currentUser");
	Posts p=new Posts(title, content, code, part.getSubmittedFileName(), null, id,u.getId(),github);
	postDao dao=new  postDao(ConnectionProvider.getConnection());
	boolean f=dao.savePost(p);
	if(f==true)
	{
		String path=request.getRealPath("/")+"blog_pic"+File.separator+part.getSubmittedFileName();
		imageUpdater iu=new imageUpdater();
		iu.save(path,part.getInputStream());
		out.println("success");
		
	}
	else
	{
		out.println("error");
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
