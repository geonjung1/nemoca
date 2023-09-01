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
		String user_id = (String)request.getSession().getAttribute("user_id");
		if(user_id == null || user_id.equals("")) {
			user_id = "NO_LOGIN_USER";
		}
		CafeRankingDao crd = CafeRankingDao.getInstance();
		List<Cafe> cafeRankingList = null;
		
		String n1 = request.getParameter("n");
		int n = 0;
		if (n1 == null || n1.equals(""))
			cafeRankingList = crd.list(user_id); // CafeRankingDao에서 cafeRankingList를 가져옴
		else {
			n = Integer.parseInt(n1);
			if ( n == 1) cafeRankingList = crd.listDessert(user_id); 
		}
		request.setAttribute("cafeRankingList", cafeRankingList);
		return "cafeRankingList";
	}
}