package model;

import java.sql.Date;

public class Board_re {
	private int br_re_no;
	private String user_id;
	private int b_no;
	private String br_content;
	private int br_ref;
	private int br_ref_level;
	private int br_ref_step;
	private Date br_reg_date;
	private String br_del;
	
	public int getBr_re_no() {
		return br_re_no;
	}
	public void setBr_re_no(int br_re_no) {
		this.br_re_no = br_re_no;
	}
	public String getuser_id() {
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
	public String getBr_content() {
		return br_content;
	}
	public void setBr_content(String br_content) {
		this.br_content = br_content;
	}
	public int getBr_ref() {
		return br_ref;
	}
	public void setBr_ref(int br_ref) {
		this.br_ref = br_ref;
	}
	public int getBr_ref_level() {
		return br_ref_level;
	}
	public void setBr_ref_level(int br_ref_level) {
		this.br_ref_level = br_ref_level;
	}
	public int getBr_ref_step() {
		return br_ref_step;
	}
	public void setBr_ref_step(int br_ref_step) {
		this.br_ref_step = br_ref_step;
	}
	public Date getBr_reg_date() {
		return br_reg_date;
	}
	public void setBr_reg_date(Date br_reg_date) {
		this.br_reg_date = br_reg_date;
	}
	public String getBr_del() {
		return br_del;
	}
	public void setBr_del(String br_del) {
		this.br_del = br_del;
	}
}