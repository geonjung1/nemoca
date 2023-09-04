package service.cafe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeLikeDao;
import service.CommandProcess;

public class CafeLike implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 1. 화면에서 던진 파라미터를 받아온다.
		String c_no = request.getParameter("c_no");
		String user_id = request.getParameter("user_id");
		String like_yn = request.getParameter("like_yn");
		
		// 2. CafeLikeDao Instance를 생성한다.
		CafeLikeDao cld = CafeLikeDao.getInstance();
		
		// 3. CafeLike 를 처리한다.
		int result = cld.doCafeLike(c_no, user_id, like_yn);
		
		// 4. CafeLike 처리 결과와 현재 화면에서 보고있던 랭킹타입을 유지하여 넘긴다.
		request.setAttribute("result", result);
		request.setAttribute("rankingType", request.getParameter("rankingType"));
		
		// 5. CafeLike 결과 화면을 호출한다.
		return "cafeLikeResult";
	}
}