package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import model.Board;
import service.CommandProcess;

public class BoardUpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 관리자가 수정하는 경우를 위해 세션체크 추가
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		Board board = new Board();
		board.setUser_id(user_id);
		

		// 이전 주소 경로 가져오기
		String prevUrl = request.getHeader("Referer");
		prevUrl = prevUrl.substring(21);

		BoardDao bd = BoardDao.getInstance();
		board = bd.select(b_no);

		request.setAttribute("board", board);
		request.setAttribute("prevUrl", prevUrl);
		
		return "boardUpdateForm";
	}

}
