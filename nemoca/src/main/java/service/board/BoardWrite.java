package service.board;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDao;
import model.Board;
import service.CommandProcess;

public class BoardWrite implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		
		Board board = new Board();
		
		board.setUser_id(user_id);
		

		
		String real = request.getServletContext().getRealPath("/upload");
		int maxSize = 1024 * 1024 * 10;
		int result = 0;
		try {
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());
			String b_img1 = mr.getFilesystemName("b_img1");
			String b_subject = mr.getParameter("b_subject");
			String b_content = mr.getParameter("b_content");
			
			board.setB_img1(b_img1);
			board.setB_subject(b_subject);
			board.setB_content(b_content);
			
			BoardDao bd = BoardDao.getInstance();
			board.setUser_id(user_id);
			result = bd.insert(board);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		request.setAttribute("result", result);

		return "boardWrite";
	}

}
