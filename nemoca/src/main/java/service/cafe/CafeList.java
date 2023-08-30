package service.cafe;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeRankingDao;
import model.Cafe;
import service.CommandProcess;

public class CafeList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		CafeRankingDao crd = CafeRankingDao.getInstance();
		
		List<Cafe> cafeRankingList = crd.list(); // CafeRankingDao에서 cafeRankingList를 가져옴
		
		request.setAttribute("cafeRankingList", cafeRankingList);
		
		return "cafeList";
	}

}