package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board_reDao;
import model.Board_re;
import service.CommandProcess;

public class Board_reDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		int br_re_no = Integer.parseInt(request.getParameter("br_re_no"));

		Board_reDao rd = Board_reDao.getInstance();
		int result = rd.delete(br_re_no);
		
		request.setAttribute("result", result);
		request.setAttribute("b_no", b_no);
		return "board_reDelete";
	}

}
