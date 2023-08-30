package service.cafe;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeRankingDao;
import model.Cafe;
import service.CommandProcess;

public class CafeSearch implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String srch = request.getParameter("srch");
		
		CafeRankingDao cf = CafeRankingDao.getInstance();
		List<Cafe> cflist = cf.search(srch);
		
		request.setAttribute("cflist", cflist);
		
		return "cafeSearch";
	}

}
