package service.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import dao.Board_likeDao;
import dao.Board_reDao;
import dao.CafeLikeDao;
import dao.CafeViewDao;
import dao.MemberDao;
import model.Board;
import model.Board_like;
import model.Board_re;
import model.Cafe;
import model.Cafe_like;
import model.Member;
import service.CommandProcess;
import service.cafe.CafeLike;
import service.cafe.CafeView;

public class MyPageForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		if (session.getAttribute("user_id") != null) {
			String user_id = (String)session.getAttribute("user_id");
					
			MemberDao md = MemberDao.getInstance();
			Member member = md.select(user_id);
			CafeViewDao cd = CafeViewDao.getInstance();
			CafeLikeDao cl = CafeLikeDao.getInstance();
			List<Cafe_like> cllist = cl.myPage(user_id);
			for(Cafe_like cafeLike:cllist) {
				int c_no = cafeLike.getC_no();
				Cafe cafe = cd.selectCafe(c_no);
				cafeLike.setC_name(cafe.getC_name());
				cafeLike.setC_loc(cafe.getC_loc());
			}
			
			BoardDao bd = BoardDao.getInstance();
			List<Board> bdList = bd.myPage(user_id);
			
			Board_likeDao bl = Board_likeDao.getInstance();
			
			List<Board_like> bllist = bl.myPage(user_id);
			for(Board_like board_like: bllist) {
				Board board = bd.select(board_like.getB_no());
				board_like.setB_subject(board.getB_subject());
				board_like.setB_reg_date(board.getB_reg_date());
			}			
			Board_reDao brd = Board_reDao.getInstance();
			List<Board_re> brdList = brd.myPage(user_id);
			
			request.setAttribute("member", member);
			request.setAttribute("bdlist", bdList); 
			request.setAttribute("brdlist", brdList);
			request.setAttribute("cllist", cllist);
			request.setAttribute("bllist", bllist);
			
		}
		return "myPageForm";
		
	}
}
