package service.cafe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeModifyDao;
import model.Cafe;
import service.CommandProcess;

public class CafeDoModify implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 1.화면에서 입력한 카페 정보를 서버에서 파라미터 수신한다.
		String c_no = request.getParameter("c_no");
		String c_name = request.getParameter("c_name");
		String c_addr = request.getParameter("c_addr");
		String c_addr_new = request.getParameter("c_addr_new");
		String c_loc = request.getParameter("c_loc");
		String c_tel = request.getParameter("c_tel");
		String c_price = request.getParameter("c_price");
		String c_optime = request.getParameter("c_optime");
		String user_id = request.getParameter("user_id");
		
		
		// 2.저장할 정보를 DTO에 담는다.
		Cafe cafe = new Cafe();
		cafe.setC_no(Integer.parseInt(c_no));
		cafe.setC_name(c_name);
		cafe.setC_addr(c_addr);
		cafe.setC_addr_new(c_addr_new);
		cafe.setC_loc(c_loc);
		cafe.setC_tel(c_tel);
		cafe.setC_price(c_price);
		cafe.setC_optime(c_optime);
		cafe.setUser_id(user_id);
		
		
		// 4.DAO 에서 저장로직을 호출한다.
		CafeModifyDao cmd = CafeModifyDao.getInstance();
		int result = cmd.updateCafe(cafe);
		request.setAttribute("result", result);
		
		// 6.결과 페이지로 이동한다.
		return "cafeModifyResult";
	}

}