package com.tech.blog.dao;
import java.sql.*;
public class likeDao {
Connection con;

	public likeDao(Connection con) {
	super();
	this.con = con;
}

	public boolean insertLike(int pid,int uid)
	{
		boolean f=false;
		try {
			
			String query="Insert into like_post(uid,pid)  values(?,?);";
			PreparedStatement pstm=this.con.prepareStatement(query);
			pstm.setInt(1,uid);
			pstm.setInt(2,pid);
			pstm.executeUpdate();
			f=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	public int countLike(int pid) throws SQLException
	{
		int count=0;
		String query="Select count(*) from like_post where pid=?";
		
		PreparedStatement pstm=this.con.prepareStatement(query);
		pstm.setInt(1,pid);
		ResultSet set=pstm.executeQuery();
		if(set.next())
		{
			count=set.getInt("count(*)");
		}
		return count;
	}
	
	public boolean isLiked(int pid,int uid) throws SQLException
	{
		boolean f=false;
		String query="Select * from like_post  where pid=? and uid=?";
		PreparedStatement p=this.con.prepareStatement(query);
		p.setInt(1,pid);
		p.setInt(2,uid);
		ResultSet set=p.executeQuery();
		if(set.next())
		{
			f=true;
		}
		return f;

	}

	public boolean deleteLike(int pid,int uid) throws SQLException
	{
		boolean f=false;
		String query="delete from like_post  where pid=? and uid=?";
		PreparedStatement p=this.con.prepareStatement(query);
		p.setInt(1,pid);
		p.setInt(2,uid);
		p.executeUpdate();
		f=true;
	
		return f;
	}


}
