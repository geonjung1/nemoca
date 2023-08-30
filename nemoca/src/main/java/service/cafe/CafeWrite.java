package service.cafe;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CafeRankingDao;
import model.Cafe;
import service.CommandProcess;

public class CafeWrite implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
	
		return "cafeWrite";
	}

}