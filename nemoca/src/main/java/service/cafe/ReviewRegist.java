package service.cafe;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.CafeRankingDao;
import dao.ReviewRegistDao;
import model.Cafe;
import service.CommandProcess;

public class ReviewRegist implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		}catch (UnsupportedEncodingException e) {e.printStackTrace();}
		int c_no =Integer.parseInt(request.getParameter("c_no"));
		String c_name = request.getParameter("c_name");
		String c_addr = request.getParameter("c_addr");
		String c_addr_new = request.getParameter("c_addr_new");
		String c_loc = request.getParameter("c_loc");
		String c_tel = request.getParameter("c_tel");
		String c_price = request.getParameter("c_price");
		String c_optime = request.getParameter("c_optime");
		
		
		Cafe cafe = new Cafe();
		cafe.setC_no(c_no);
		cafe.setC_name(c_name);
		cafe.setC_addr(c_addr);
		cafe.setC_addr_new(c_addr_new);
		cafe.setC_loc(c_loc);
		cafe.setC_tel(c_tel);
		cafe.setC_price(c_price);
		cafe.setC_optime(c_optime);
		
		ReviewRegistDao rrd = ReviewRegistDao.getInstance();
		int result =  rrd.update(cafe);
		request.setAttribute("result", result);
		
	
		return "reviewRegist";
	}

}