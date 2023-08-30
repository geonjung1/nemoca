package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class UpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String user_id = request.getParameter("user_id");
		
		// 이전 주소 경로 가져오기
		String prevUrl = request.getHeader("Referer");
		prevUrl = prevUrl.substring(21);
	
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(user_id);
		
		request.setAttribute("member", member);
		request.setAttribute("prevUrl", prevUrl);
		
		return "updateForm";
	}

}
