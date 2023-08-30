package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board_reDao;
import model.Board_re;
import service.CommandProcess;

public class Board_reWrite implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 세션으로 mno 가져오기
				HttpSession session = request.getSession();
				String user_id = (String) session.getAttribute("user_id");
				
				// param으로 데이터 가져오기
				String br_content = request.getParameter("br_content");
				int b_no = Integer.parseInt(request.getParameter("b_no"));
				int br_re_no = Integer.parseInt(request.getParameter("br_re_no"));
				
				// reply 세팅
				Board_re board_re = new Board_re();
				board_re.setBr_content(br_content);
				board_re.setUser_id(user_id);
				board_re.setB_no(b_no);
				board_re.setBr_re_no(br_re_no);
				
		//		board_re.setBr_re_no(br_re_no);
				if (br_re_no != 0) { // 답변글일 때
					int br_ref = Integer.parseInt(request.getParameter("br_ref"));
					int br_ref_step = Integer.parseInt(request.getParameter("br_ref_step"));
					int br_ref_level = Integer.parseInt(request.getParameter("br_ref_level"));
					board_re.setBr_ref(br_ref);
					board_re.setBr_ref_step(br_ref_step);
					board_re.setBr_ref_level(br_ref_level);
				//	board_re.setbr_re_no(br_re_no);
				}
				
				
				Board_reDao rd = Board_reDao.getInstance();
				int result = rd.insert(board_re);
				
				request.setAttribute("result", result);
				request.setAttribute("b_no", b_no);
		//		request.setAttribute("br_re_no", br_re_no);
				
		return "board_reWrite";
	}

}
