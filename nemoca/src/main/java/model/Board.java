package model;

import java.sql.Date;

public class Board {
	 private int b_no;
	 private String b_subject;
	 private String b_img1;
	 private String b_content;
	 private Date b_reg_date;
	 private String b_del;
	 private int b_readcount;
	 private String user_id;
	 private int likes;
	 
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_subject() {
		return b_subject;
	}
	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}
	public String getB_img1() {
		return b_img1;
	}
	public void setB_img1(String b_img1) {
		this.b_img1 = b_img1;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public Date getB_reg_date() {
		return b_reg_date;
	}
	public void setB_reg_date(Date b_reg_date) {
		this.b_reg_date = b_reg_date;
	}
	public String getB_del() {
		return b_del;
	}
	public void setB_del(String b_del) {
		this.b_del = b_del;
	}
	public int getB_readcount() {
		return b_readcount;
	}
	public void setB_readcount(int b_readcount) {
		this.b_readcount = b_readcount;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	
	
}
