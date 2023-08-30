package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board_reDao;
import model.Board_re;
import service.CommandProcess;

public class Board_reUpdate implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// param으로 데이터 가져오기
		//		int b_no = Integer.parseInt(request.getParameter("b_no"));
				int br_re_no = Integer.parseInt(request.getParameter("br_re_no"));
				String br_content = request.getParameter("br_content");
				
				// reply 세팅
				Board_re board_re = new Board_re();
				board_re.setBr_re_no(br_re_no);
				board_re.setBr_content(br_content);
		//		board_re.setB_no(b_no);
				
				Board_reDao rd = Board_reDao.getInstance();
				int result = rd.update(board_re);
				
		//		request.setAttribute("b_no", b_no);
				request.setAttribute("br_re_no", br_re_no);
				request.setAttribute("result", result);
		return "board_reUpdate";
	}

}
