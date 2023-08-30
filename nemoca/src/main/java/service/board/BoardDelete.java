package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import service.CommandProcess;

public class BoardDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int b_no = Integer.parseInt(request.getParameter("b_no"));

		BoardDao bd = BoardDao.getInstance();
		int result = bd.delete(b_no);
		
		request.setAttribute("result", result);
		request.setAttribute("b_no", b_no);
		
		return "boardDelete";
	}

}
