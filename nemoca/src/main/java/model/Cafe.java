package model;

import java.sql.Date;

public class Cafe {
	private int c_no;
	private String c_name;
	private String c_type;
	private String c_addr;
	private String c_addr_new;
	private String c_loc;
	private String c_tel;
	private String c_price;
	private String c_optime;
	private String c_img1;
	private String c_img2;
	private String c_img3;
	private String c_menu1;
	private String c_menu2;
	private String c_menu3;
	private Date c_join_date;
	private String c_del;
	private Date c_del_date;
	private int c_readcount;
	private String user_id;
	private int like_count;
	private int cafe_like_rank;
	private String like_yn;
	private int c_replycount;
	private String star;
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_type() {
		return c_type;
	}
	public void setC_type(String c_type) {
		this.c_type = c_type;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_addr() {
		return c_addr;
	}
	public void setC_addr(String c_addr) {
		this.c_addr = c_addr;
	}
	public String getC_addr_new() {
		return c_addr_new;
	}
	public void setC_addr_new(String c_addr_new) {
		this.c_addr_new = c_addr_new;
	}
	public String getC_loc() {
		return c_loc;
	}
	public void setC_loc(String c_loc) {
		this.c_loc = c_loc;
	}
	public String getC_tel() {
		return c_tel;
	}
	public void setC_tel(String c_tel) {
		this.c_tel = c_tel;
	}
	public String getC_price() {
		return c_price;
	}
	public void setC_price(String c_price) {
		this.c_price = c_price;
	}
	public String getC_optime() {
		return c_optime;
	}
	public void setC_optime(String c_optime) {
		this.c_optime = c_optime;
	}
	public String getC_img1() {
		return c_img1;
	}
	public void setC_img1(String c_img1) {
		this.c_img1 = c_img1;
	}
	public String getC_img2() {
		return c_img2;
	}
	public void setC_img2(String c_img2) {
		this.c_img2 = c_img2;
	}
	public String getC_img3() {
		return c_img3;
	}
	public void setC_img3(String c_img3) {
		this.c_img3 = c_img3;
	}
	public String getC_menu1() {
		return c_menu1;
	}
	public void setC_menu1(String c_menu1) {
		this.c_menu1 = c_menu1;
	}
	public String getC_menu2() {
		return c_menu2;
	}
	public void setC_menu2(String c_menu2) {
		this.c_menu2 = c_menu2;
	}
	public String getC_menu3() {
		return c_menu3;
	}
	public void setC_menu3(String c_menu3) {
		this.c_menu3 = c_menu3;
	}
	public Date getC_join_date() {
		return c_join_date;
	}
	public void setC_join_date(Date c_join_date) {
		this.c_join_date = c_join_date;
	}
	public String getC_del() {
		return c_del;
	}
	public void setC_del(String c_del) {
		this.c_del = c_del;
	}
	public Date getC_del_date() {
		return c_del_date;
	}
	public void setC_del_date(Date c_del_date) {
		this.c_del_date = c_del_date;
	}
	public int getC_readcount() {
		return c_readcount;
	}
	public void setC_readcount(int c_readcount) {
		this.c_readcount = c_readcount;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public int getCafe_like_rank() {
		return cafe_like_rank;
	}
	public void setCafe_like_rank(int cafe_like_rank) {
		this.cafe_like_rank = cafe_like_rank;
	}
	public String getLike_yn() {
		return like_yn;
	}
	public void setLike_yn(String like_yn) {
		this.like_yn = like_yn;
	}
	public int getC_replycount() {
		return c_replycount;
	}
	public void setC_replycount(int c_replycount) {
		this.c_replycount = c_replycount;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
}
