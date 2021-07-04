package com.tech.blog.dao;
import com.tech.blog.entities.*;
import java.sql.*;
public class userDao {

	private Connection con;

	public userDao(Connection con) {
	
		this.con = con;
	}
	
	public boolean saveUser(user u)
	{
		boolean f=false;
		try {
			String qy="Select * from user where mail=?";
			PreparedStatement pstmt=con.prepareStatement(qy);
			pstmt.setString(1,u.getEmail());
			
			ResultSet set=pstmt.executeQuery();
			
			if(set.next())
			{
				return false;
			}
			String query ="insert into user(name,mail,password,gender,about) values(?,?,?,?,?);";
		
			PreparedStatement pstm=this.con.prepareStatement(query);
			pstm.setString(1,u.getName());
			pstm.setString(2,u.getEmail());
			pstm.setString(3,u.getPassword());
			pstm.setString(4,u.getGender());
			pstm.setString(5,u.getAbout());
			 pstm.executeUpdate();
			f=true;

		}
			catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return f;
		
	}
	
	
	//for login
	
	public user getUser(String email,String password)
	{
		user u=null;
		try {
			String query="Select * from user where mail=? and password=?";
			PreparedStatement pstm=con.prepareStatement(query);
			pstm.setString(1,email);
			pstm.setString(2,password);
			ResultSet set=pstm.executeQuery();
			if(set.next())
			{
				u=new user();
				String name=set.getString("name");
				u.setName(name);
				u.setId(set.getInt("id"));
				u.setEmail(set.getString("mail"));
				u.setPassword(set.getString("password"));
				u.setGender(set.getString("gender"));
				u.setAbout(set.getString("about"));
				u.setDateTime(set.getTimestamp("rdate"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return u;
	}
}
