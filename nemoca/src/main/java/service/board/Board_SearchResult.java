package service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import model.Board;
import service.CommandProcess;

public class Board_SearchResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String srch = request.getParameter("srch");

		
		BoardDao bd = BoardDao.getInstance();
		List<Board> bdList = bd.search(srch);
		
		request.setAttribute("bdList", bdList);

		return "board_searchResult"; 
	}

}
