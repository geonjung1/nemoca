package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board_likeDao;
import dao.BoardDao;
import dao.MemberDao;
import model.Board_like;
import model.Board;
import model.Member;
import service.CommandProcess;

public class Board_LikeCnt implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {	
		// 세션으로 mno 가져오기
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		
		// param으로 bno 가져옴
		int b_no = Integer.parseInt(request.getParameter("b_no"));
	
		// bdlikes에 회원이 좋아요한 게시글 있는지 조회
		Board_likeDao bld = Board_likeDao.getInstance();
	
		int bdlikes = bld.select(user_id, b_no); 
		
		// bdLikesCnt.jsp에 보내줄 변수 생성
		String imgSrc = "";
		int likes = 0;

		// board 테이블의 likes 변경하기 위해 객체 추가
		BoardDao bd = BoardDao.getInstance();
		
		if (bdlikes > 0) { // 좋아요 한 게시글이 있으면
			bld.delete(user_id, b_no); // bdlikes 테이블에서 데이터 삭제
			bd.likesMinus(b_no); // likes - 1
			imgSrc = "/nemoca/images/heart11.PNG";

		} else if (bdlikes == 0) { // 좋아요 한 게시글이 없으면
			bld.insert(user_id, b_no); // bdlikes 테이블에 데이터 추가
			bd.likesPlus(b_no); // likes + 1
			imgSrc = "/nemoca/images/heart22.PNG";
		}			
		
		// board 테이블의 현재 likes 조회
		Board board = bd.select(b_no);
		likes = board.getLikes();
		
		request.setAttribute("likes", likes);
		request.setAttribute("imgSrc", imgSrc);

		return "board_likeCnt";
	}

}
