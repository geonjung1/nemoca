package service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import dao.Board_likeDao;
import dao.Board_reDao;
import model.Board;
import model.Board_re;
import service.CommandProcess;

public class BoardView implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int b_no = Integer.parseInt(request.getParameter("b_no"));
	//	int br_re_no = Integer.parseInt(request.getParameter("br_re_no"));
	//	String user_id = "user";
		BoardDao bd = BoardDao.getInstance();
		// 조회수 카운트
		bd.readcountUpdate(b_no);

		// 데이터 가져오기
		Board board = bd.select(b_no);
		String user_id = board.getUser_id();

		// 회원테이블에서 닉네임 데이터 가져오기
	//	String nickname = board.getUser_ID(); // board에 저장된 mno
	//	MemberDao md = MemberDao.getInstance();
	//	String nick_nm = md.selectNick(mno);

		
//		Board_reDao brd = Board_reDao.getInstance();
//		Board_re board_re = brd.select(br_re_no);
		
//		int br_re_no = Board_re.get;
//		int br_re_no = brd.selectLikes(br_re_no);
	
		
	//	board.setUser_id("user");
		
		
		
		// bdlikes에 회원이 좋아요한 게시글 있는지 조회
		Board_likeDao bld = Board_likeDao.getInstance();
		HttpSession session = request.getSession(); 
		user_id = (String) session.getAttribute("user_id");
		String imgSrc = "";
		
		if (session.getAttribute("user_id") != null) {
		
	/*		b_no = (int) session.getAttribute("b_no"); // session mno */
			
			user_id = (String) session.getAttribute("user_id");
			int bdlikes = bld.select(user_id, b_no);
			
			if (bdlikes > 0) { // 좋아요 한 게시글이면
				imgSrc = "/nemoca/images/heart22.PNG";

			} else if (bdlikes == 0) { // 좋아요 한 게시글이 아니면
				imgSrc = "/nemoca/images/heart11.PNG";
			}
		}
	
		// reply 세팅
//		String br_content = request.getParameter("br_content");
//		int br_re_no = Integer.parseInt(request.getParameter("br_re_no"));
//		
//		Board_re board_re = new Board_re();
//		board_re.setBr_content(br_content);
//		board_re.setUser_id(user_id);
//		board_re.setB_no(b_no);
//		board_re.setbr_re_no(br_re_no);
		
		
		// 댓글
		Board_reDao rd = Board_reDao.getInstance();
		
		List<Board_re> list = rd.list(b_no); // 댓글 목록
		int board_re_cnt = list.size(); // 게시글에 해당하는 댓글 수
		
	//	int result = rd.insert(board_re);
		
	//	RpLikesDao rld = RpLikesDao.getInstance();
	//	List<RpLikes> list2 = rld.list(); // 댓글 좋아요 목록
    
		request.setAttribute("b_no", b_no);
		request.setAttribute("board", board);
	//	request.setAttribute("br_re_no", br_re_no);
	//	request.setAttribute("nick_nm", nick_nm);
		request.setAttribute("list", list);
		request.setAttribute("user_id", user_id);
	//	request.setAttribute("list2", list2);
		request.setAttribute("board_re_cnt", board_re_cnt);
		request.setAttribute("imgSrc", imgSrc);
		
	//	request.setAttribute("result", result);
		
		return "boardView";
	}

}
