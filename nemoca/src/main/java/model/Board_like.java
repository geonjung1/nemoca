package model;

import java.sql.Date;

public class Board_like {
	private String user_id;
	private int b_no;
	// 조회용
	private String B_subject;
	private Date B_reg_date;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_subject() {
		return B_subject;
	}
	public void setB_subject(String b_subject) {
		B_subject = b_subject;
	}
	public Date getB_reg_date() {
		return B_reg_date;
	}
	public void setB_reg_date(Date b_reg_date) {
		B_reg_date = b_reg_date;
	}
	
}