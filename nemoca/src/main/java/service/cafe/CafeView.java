package service.cafe;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeViewDao;
import model.Cafe;
import model.Cafe_re;
import service.CommandProcess;

public class CafeView implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String c_no = request.getParameter("c_no");
		
		CafeViewDao cvd = CafeViewDao.getInstance();
		
		cvd.updateReadCountOne(Integer.parseInt(c_no));
		
		Cafe cafe = cvd.selectCafe(Integer.parseInt(c_no));
		request.setAttribute("cafe", cafe);
		
		List<Cafe_re> cafeReviewList = cvd.selectCafeReviewList(Integer.parseInt(c_no));
		request.setAttribute("cafeReviewList", cafeReviewList);
		
		return "cafeView";
	}

}