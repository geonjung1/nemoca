package service.cafe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeRegistDao;
import model.Cafe;
import service.CommandProcess;

public class CafeDoRegist implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 1.화면에서 입력한 카페 정보를 서버에서 파라미터 수신한다.
		String c_name = request.getParameter("c_name");
		String c_addr = request.getParameter("c_addr");
		String c_addr_new = request.getParameter("c_addr_new");
		String c_loc = request.getParameter("c_loc");
		String c_tel = request.getParameter("c_tel");
		String c_price = request.getParameter("c_price");
		String c_optime = request.getParameter("c_optime");
		String user_id = request.getParameter("user_id");
		
		
		// 2. 카페번호를 따준다
		//    > 상세로직 : db에서 카페테이블에 등록되어져있는 가장큰 카페번호를 가저와서 +1 한다
		//              db에서 카페테이블에 등록되어져있는 데이터가 없는경우, 1로 정한다
		CafeRegistDao crd = CafeRegistDao.getInstance();
		Integer c_no = crd.selectMaximumCafeNumber();
		if(c_no == null)
			c_no = Integer.parseInt("1");
		else
			c_no++;
		
		
		// 3.저장할 정보를 DTO에 담는다.
		Cafe cafe = new Cafe();
		cafe.setC_no(c_no);
		cafe.setC_name(c_name);
		cafe.setC_addr(c_addr);
		cafe.setC_addr_new(c_addr_new);
		cafe.setC_loc(c_loc);
		cafe.setC_tel(c_tel);
		cafe.setC_price(c_price);
		cafe.setC_optime(c_optime);
		cafe.setUser_id(user_id);
		
		
		// 4.DAO 에서 저장로직을 호출한다.
		int result = crd.insertCafe(cafe);
		request.setAttribute("result", result);
		
		// 6.결과 페이지로 이동한다.
		return "cafeRegistResult";
	}

}