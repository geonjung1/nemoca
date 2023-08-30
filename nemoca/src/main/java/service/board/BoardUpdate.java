package service.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDao;
import model.Board;
import service.CommandProcess;

public class BoardUpdate implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		// 이전 주소
		String prevUrl = request.getParameter("prevUrl");

		// 관리자가 수정하는 경우를 위해 세션체크 추가
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");

		// 파일 업로드 경로
		String real = request.getSession().getServletContext().getRealPath("/upload");
		int maxSize = 1024 * 1024 * 10; // 최대 사이즈

		// board 생성
		Board board = new Board();
		board.setUser_id(user_id);
		try { // 같은 파일 이름에 자동으로 숫자 추가
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());
			// param 가져오기
			String b_img1 = mr.getFilesystemName("b_img1");
			String b_subject = mr.getParameter("b_subject");
			String b_content = mr.getParameter("b_content");

			// board 세팅
			board.setB_img1(b_img1);
			board.setB_subject(b_subject);
			board.setB_content(b_content);
			board.setB_no(b_no);

		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());
			;
		}

		BoardDao bd = BoardDao.getInstance();
		int result = bd.update(board);

		request.setAttribute("result", result);
		request.setAttribute("b_no", b_no);
		request.setAttribute("prevUrl", prevUrl);
		
		return "boardUpdate";
	}

}
