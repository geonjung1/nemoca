package service.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import dao.Board_reDao;
import dao.MemberDao;
import model.Board;
import model.Board_re;
import model.Member;
import service.CommandProcess;

public class MyPageForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		if (session.getAttribute("user_id") != null) {
			String user_id = (String)session.getAttribute("user_id");
					
			MemberDao md = MemberDao.getInstance();
			Member member = md.select(user_id);
						
			BoardDao bd = BoardDao.getInstance();
			List<Board> bdList = bd.myPage(user_id);
			
			Board_reDao brd = Board_reDao.getInstance();
			List<Board_re> brdList = brd.myPage(user_id);
			
			request.setAttribute("member", member);
			request.setAttribute("bdlist", bdList); 
			request.setAttribute("brdlist", brdList);
			
		}
		return "myPageForm";
		
	}
}
