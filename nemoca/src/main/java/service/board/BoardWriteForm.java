package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Board;
import service.CommandProcess;

public class BoardWriteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		Board board = new Board();
		board.setUser_id(user_id);

		return "boardWriteForm";
	}

}
