package com.tech.blog.entities;

import java.sql.Timestamp;

public class Posts {
private int pid;
private String pTitle;
private String pContent;
private String github;
public String getGithub() {
	return github;
}
public void setGithub(String github) {
	this.github = github;
}
private String pCode;
private String pPic;
private Timestamp pDate;
private int sid;
private int uid;
public Posts(int pid, String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int sid,int uid,String github) {
	super();
	this.pid = pid;
	this.pTitle = pTitle;
	this.pContent = pContent;
	this.pCode = pCode;
	this.pPic = pPic;
	this.pDate = pDate;
	this.sid = sid;
	this.uid=uid;
	this.github=github;
}
public int getUid() {
	return uid;
}
public void setUid(int uid) {
	this.uid = uid;
}
public Posts(String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int sid,int uid,String github) {
	super();
	this.pTitle = pTitle;
	this.pContent = pContent;
	this.pCode = pCode;
	this.pPic = pPic;
	this.pDate = pDate;
	this.sid = sid;
	this.uid=uid;
	this.github=github;
}
public int getPid() {
	return pid;
}
public void setPid(int pid) {
	this.pid = pid;
}
public String getpTitle() {
	return pTitle;
}
public void setpTitle(String pTitle) {
	this.pTitle = pTitle;
}
public String getpContent() {
	return pContent;
}
public void setpContent(String pContent) {
	this.pContent = pContent;
}
public String getpCode() {
	return pCode;
}
public void setpCode(String pCode) {
	this.pCode = pCode;
}
public String getpPic() {
	return pPic;
}
public void setpPic(String pPic) {
	this.pPic = pPic;
}
public Timestamp getpDate() {
	return pDate;
}
public void setpDate(Timestamp pDate) {
	this.pDate = pDate;
}
public int getSid() {
	return sid;
}
public void setSid(int sid) {
	this.sid = sid;
}

}
