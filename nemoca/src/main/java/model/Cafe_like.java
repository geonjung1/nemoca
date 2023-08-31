package model;

public class Cafe_like {
	private String user_id;
	private int c_no;
	
	// 읽기 전용
	private String c_name;
	private String c_loc;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_loc() {
		return c_loc;
	}
	public void setC_loc(String c_loc) {
		this.c_loc = c_loc;
	}
}