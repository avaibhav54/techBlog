package com.tech.blog.servlets;
import com.tech.blog.entities.*;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.dao.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class registerServlet
 */
@WebServlet("/registerServlet")
@MultipartConfig
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	PrintWriter out=response.getWriter();
	String name=request.getParameter("user_name");
	String mail=request.getParameter("mail");
	String password=request.getParameter("password");
	String gender=request.getParameter("gender");
	String about=request.getParameter("about");
	response.setContentType("text/html");
	String chk=request.getParameter("check");
	if(chk==null)
	{
		out.println("Please accept terms and condition");
	}else
	{
	

		user o=new user(name,mail,password,gender,about);
		userDao dao=new userDao(ConnectionProvider.getConnection());
		boolean f=dao.saveUser(o);
		if(f==true)
		{
			out.println("done");
		}
		else
		{
			out.println("Email already Registered");
		}
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
