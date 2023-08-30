package service.cafe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeModifyDao;
import model.Cafe;
import service.CommandProcess;

public class CafeModify implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String c_no = request.getParameter("c_no");
		
		CafeModifyDao cmd = CafeModifyDao.getInstance();
		
		Cafe cafe = new Cafe();
		cafe.setC_no(Integer.parseInt(c_no));
		cafe = cmd.selectCafe(cafe);
		
		request.setAttribute("cafe", cafe);
		
		return "cafeModify";
	}

}