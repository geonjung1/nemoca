package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board_reDao;

import model.Board_re;
import service.CommandProcess;

public class Board_reUpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// param으로 데이터 가져오기
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
	//	int b_no = Integer.parseInt(request.getParameter("b_no"));
		int br_re_no = Integer.parseInt(request.getParameter("br_re_no"));
		String br_content = request.getParameter("br_content");
		
		Board_re board_re = new Board_re();
		board_re.setUser_id(user_id);
		board_re.setBr_content(br_content);
	//	board_re.setB_no(b_no);
		

		// 이전 주소 경로 가져오기
		String prevUrl = request.getHeader("Referer");
		prevUrl = prevUrl.substring(21);

		Board_reDao brd = Board_reDao.getInstance();
		board_re = brd.select(br_re_no);
		

		request.setAttribute("board_re", board_re);
		request.setAttribute("prevUrl", prevUrl);
	//	request.setAttribute("b_no", b_no);
		
		return "board_reUpdateForm";
	}

}
