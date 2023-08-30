package service.cafe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewRegistDao;
import model.Cafe;
import service.CommandProcess;

public class ReviewWrite implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		ReviewRegistDao crd = ReviewRegistDao.getInstance();
		Cafe cafe = crd.select(c_no);
		request.setAttribute("cafe",cafe);
		return "reviewWrite";
	}

}