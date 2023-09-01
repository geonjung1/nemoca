package service.cafe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeReviewModifyDao;
import dao.CafeViewDao;
import model.Cafe;
import model.Cafe_re;
import service.CommandProcess;

public class CafeReviewModify implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String cr_no = request.getParameter("cr_no");
		String c_no = request.getParameter("c_no");
		
		
		CafeReviewModifyDao crmd = CafeReviewModifyDao.getInstance();
		Cafe_re cafeReview = crmd.selectCafeReview(cr_no, c_no);
		request.setAttribute("cafeReview", cafeReview);
		
		
		CafeViewDao cvd = CafeViewDao.getInstance();
		Cafe cafe = cvd.selectCafe(Integer.parseInt(c_no));
		request.setAttribute("cafe", cafe);

		 
		return "cafeReviewModify";
	}

}