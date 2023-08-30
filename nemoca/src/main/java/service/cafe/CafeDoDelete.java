package service.cafe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeDeleteDao;
import model.Cafe;
import service.CommandProcess;

public class CafeDoDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 1.화면에서 입력한 카페 정보를 서버에서 파라미터 수신한다.
		String c_no = request.getParameter("c_no");
		
		
		// 2.저장할 정보를 DTO에 담는다.
		Cafe cafe = new Cafe();
		cafe.setC_no(Integer.parseInt(c_no));
		
		
		// 3.DAO 에서 저장로직을 호출한다.
		CafeDeleteDao cdd = CafeDeleteDao.getInstance();
		int result = cdd.deleteCafe(cafe);
		request.setAttribute("result", result);
		
		// 4.결과 페이지로 이동한다.
		return "cafeDeleteResult";
	}

}