package service.cafe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeLikeDao;
import service.CommandProcess;

public class CafeLike implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String c_no = request.getParameter("c_no");
		String user_id = request.getParameter("user_id");
		String like_yn = request.getParameter("like_yn");
		
		CafeLikeDao cld = CafeLikeDao.getInstance();
		
		cld.doCafeLike(c_no, user_id, like_yn);
		
		return "cafeLikeResult";
	}

}