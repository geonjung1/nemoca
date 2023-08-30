package model;

import java.sql.Date;

public class Cafe_re {
	private int cr_no;
	private String cr_content;
	private Date cr_reg_date;
	private String cr_del;
	private Date cr_del_date;
	private String user_id;
	private int c_no;

	private String nickname;
	private String user_img;
	
	public int getCr_no() {
		return cr_no;
	}
	public void setCr_no(int cr_no) {
		this.cr_no = cr_no;
	}
	public String getCr_content() {
		return cr_content;
	}
	public void setCr_content(String cr_content) {
		this.cr_content = cr_content;
	}
	public Date getCr_reg_date() {
		return cr_reg_date;
	}
	public void setCr_reg_date(Date cr_reg_date) {
		this.cr_reg_date = cr_reg_date;
	}
	public String getCr_del() {
		return cr_del;
	}
	public void setCr_del(String cr_del) {
		this.cr_del = cr_del;
	}
	public Date getCr_del_date() {
		return cr_del_date;
	}
	public void setCr_del_date(Date cr_del_date) {
		this.cr_del_date = cr_del_date;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
}