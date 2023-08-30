package service.cafe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cafe;
import service.CommandProcess;

public class CafeReview implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String c_no = request.getParameter("c_no");
		String c_name = request.getParameter("c_name");
		
		Cafe cafe = new Cafe();
		cafe.setC_no(Integer.parseInt(c_no));
		cafe.setC_name(c_name);
		
		request.setAttribute("cafe", cafe);
		
		return "cafeReview";
	}

}