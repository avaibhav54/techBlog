package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.tech.blog.entities.Posts;
import com.tech.blog.entities.category;

public class postDao {

	Connection con;

	public postDao(Connection con) {
		super();
		this.con = con;
	}
	public ArrayList<category> getAllCategories()
	{
		ArrayList<category> list=new ArrayList<>();
		
		try {
			String query="Select * from categories;";
			PreparedStatement prstm=con.prepareStatement(query);
	
			ResultSet set=prstm.executeQuery();
			while(set.next())
			{
				
				int cid=set.getInt("cid");
				String name=set.getString("name");
				String description=set.getString("description");
				
				category c=new category(cid,name,description);
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return list;
		
	}
	
	public boolean savePost(Posts p)
	{
		boolean f=false;
		try {
			
			String query="Insert into posts(pTitle,pContent,pCode,pPic,cid,uid,github) values(?,?,?,?,?,?,?) ";
			PreparedStatement pstm=con.prepareStatement(query);
			pstm.setString(1,p.getpTitle());
			pstm.setString(2,p.getpContent());
			pstm.setString(3,p.getpCode());
			pstm.setString(4,p.getpPic());
			pstm.setInt(5,p.getSid());
			pstm.setInt(6,p.getUid());
			pstm.setString(7, p.getGithub());
			pstm.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
	
	public ArrayList<Posts> getAllPosts()
	{
		 ArrayList<Posts> list =new ArrayList<>();
System.out.println("calling getting all posts function");
			try {
				String query="Select * from posts order by pid desc;";
				PreparedStatement prstm=con.prepareStatement(query);
		
				ResultSet set=prstm.executeQuery();
				while(set.next())
				{
			int pid=set.getInt("pid");
			String ptitle =set.getString("pTitle");
			String pContent=set.getString("pContent");
			String pCode =set.getString("pCode");
			String pPic =set.getString("pPic");
			Timestamp date=set.getTimestamp("pDate");
				int cid=set.getInt("cid");
				int uid=set.getInt("uid");

				String github =set.getString("github");
				System.out.println(pid);
				Posts p=new Posts(pid,ptitle, pContent, pCode, pPic, date, cid, uid,github);
				
				list.add(p);
				}
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
			return list;
	}
	public ArrayList<Posts> getAllPostsById(int id)
	{
		 ArrayList<Posts> list =new ArrayList<>();

			try {
				String query="Select * from posts where cid=?;";
				PreparedStatement prstm=con.prepareStatement(query);
		prstm.setInt(1, id);
				ResultSet set=prstm.executeQuery();
				while(set.next())
				{
			int pid=set.getInt("pid");
			String ptitle =set.getString("pTitle");
			String pContent=set.getString("pContent");
			String pCode =set.getString("pCode");
			String pPic =set.getString("pPic");
			Timestamp date=set.getTimestamp("pDate");
				int cid=set.getInt("cid");
				int uid=set.getInt("uid");

				String github =set.getString("github");
				Posts p=new Posts(pid,ptitle, pContent, pCode, pPic, date, cid, uid,github);
				list.add(p);
				
				}
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
			return list;
	}
	public Posts getAllPostsByPostId(int id)
	{
Posts po=null;
			try {
				String query="Select * from posts where pid=?;";
				PreparedStatement prstm=con.prepareStatement(query);
		prstm.setInt(1, id);
				ResultSet set=prstm.executeQuery();
				if(set.next())
				{
			int pid=set.getInt("pid");
			String ptitle =set.getString("pTitle");
			String pContent=set.getString("pContent");
			String pCode =set.getString("pCode");
			String pPic =set.getString("pPic");
			Timestamp date=set.getTimestamp("pDate");
				int cid=set.getInt("cid");
				int uid=set.getInt("uid");

				String github =set.getString("github");
				po=new Posts(pid,ptitle, pContent, pCode, pPic, date, cid, uid,github);
				
				
				}
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
			return po;
	}
	
}
