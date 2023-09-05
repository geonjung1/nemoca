package service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Board;
import service.CommandProcess;

public class BoardMain implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		BoardDao bd = BoardDao.getInstance();
		
		final int ROW_PER_PAGE = 9;
		final int PAGE_PER_BLOCK = 5;
		
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		
		int total = bd.getTotal();
		
		//	시작번호 : (페이지번호 - 1)*페이지당 갯수+1
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		//	끝 번호 : 시작번호 + 페이지당갯수 - 1
		int endRow = startRow + ROW_PER_PAGE - 1;
		
		
		int num = total - startRow + 1;
		int totalPage = (int) Math.ceil((double) total / ROW_PER_PAGE);
		//	스타트페이지 : 현재페이지 - (현재페이지 - 1)%10
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
		//	엔드페이지 : 시작페이지 + 블록당페이지수 + -1
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		//  endPage는 총페이지보다 크면 안 된다.
		if (endPage > totalPage)
			endPage = totalPage;
		
		List<Board> list = bd.list(startRow, endRow); // order by bno (최신순)
		List<Board> list2 = bd.list2(startRow, endRow); // order by read_cnt (조회순)
		List<Board> list3 = bd.list3(startRow, endRow); // order by likes (인기순)
		
//		jsp에 보낼 데이터를 request에 setting해야 한다
		request.setAttribute("num", num);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("pageNum", pageNum);
		return "boardMain";
	}

}
