package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class FindPassResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String nickname = request.getParameter("nickname");
		String user_id = request.getParameter("user_id");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.findPass(nickname, user_id); 
		
		request.setAttribute("member", member);
		return "findPassResult";
	}
	
}
