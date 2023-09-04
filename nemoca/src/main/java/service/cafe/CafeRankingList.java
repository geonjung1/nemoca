package service.cafe;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeRankingDao;
import model.Cafe;
import service.CommandProcess;

public class CafeRankingList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 1. 해당 페이지를 요청한 사용자의 ID값을 세션에서 받아온다.
		//   >> 세션에 사용자 ID가 없는 경우 (로그인을 하지 않았거나, 예외상황 접근인 경우) 사용자 ID를 NO_LOGIN_USER로 판단한다.
		String user_id = (String)request.getSession().getAttribute("user_id");
		if(user_id == null) {
			user_id = "NO_LOGIN_USER";
		}
		
		// 2. CafeRankingDao Instance를 생성한다.
		CafeRankingDao crd = CafeRankingDao.getInstance();
		
		// 3. cafeRankingList 리스트 변수를 선언한다.
		List<Cafe> cafeRankingList = null;
		
		// 4. Ranking Type 파라미터를 확인
		String rankingType = request.getParameter("rankingType");
		cafeRankingList = crd.list(user_id, rankingType); // CafeRankingDao에서 cafeRankingList를 가져옴

		// 5. CafeRankingList 결과 데이터를 넘긴다.
		request.setAttribute("cafeRankingList", cafeRankingList);
		request.setAttribute("rankingType", rankingType);
		
		// 6. CafeRankingList 결과 화면을 호출한다.
		return "cafeRankingList";
	}
}