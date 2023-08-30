package service.cafe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeReviewDeleteDao;
import model.Cafe_re;
import service.CommandProcess;

public class CafeDoReviewDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 1.화면에서 입력한 카페 정보를 서버에서 파라미터 수신한다.
		String cr_no = request.getParameter("cr_no");
		String c_no = request.getParameter("c_no");
		
		
		// 2.삭제할 정보를 DTO에 담는다.
		Cafe_re cafeReview = new Cafe_re();
		cafeReview.setCr_no(Integer.parseInt(cr_no));
		cafeReview.setC_no(Integer.parseInt(c_no));
		
		// 3.DAO 에서 저장로직을 호출한다.
		CafeReviewDeleteDao crdd = CafeReviewDeleteDao.getInstance();
		int result = crdd.deleteCafeReview(cafeReview);
		request.setAttribute("result", result);

		request.setAttribute("c_no", c_no);
		
		// 5.결과 페이지로 이동한다.
		return "cafeReviewDeleteResult";
	}

}