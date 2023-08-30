package service.cafe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeReviewRegistDao;
import model.Cafe_re;
import service.CommandProcess;

public class CafeDoReviewRegist implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 1.화면에서 입력한 카페 정보를 서버에서 파라미터 수신한다.
		String c_no = request.getParameter("c_no");
		String cr_content = request.getParameter("cr_content");
		String user_id = request.getParameter("user_id");
		
		
		// 2. 카페리뷰번호를 따준다
		//    > 상세로직 : db에서 카페테이블에 등록되어져있는 가장큰 카페번호를 가저와서 +1 한다
		//              db에서 카페테이블에 등록되어져있는 데이터가 없는경우, 1로 정한다
		CafeReviewRegistDao crrd = CafeReviewRegistDao.getInstance();
		Integer cr_no = crrd.selectMaximumCafeReviewNumber(c_no);
		if(cr_no == null)
			cr_no = Integer.parseInt("1");
		else
			cr_no++;
		
		
		// 3.저장할 정보를 DTO에 담는다.
		Cafe_re cafeReview = new Cafe_re();
		cafeReview.setCr_no(cr_no);
		cafeReview.setCr_content(cr_content);
		cafeReview.setUser_id(user_id);
		cafeReview.setC_no(Integer.parseInt(c_no));
		
		// 4.DAO 에서 저장로직을 호출한다.
		int result = crrd.insertCafeReview(cafeReview);
		request.setAttribute("result", result);
		request.setAttribute("c_no", c_no);
		
		// 5.결과 페이지로 이동한다.
		return "cafeReviewRegistResult";
	}

}