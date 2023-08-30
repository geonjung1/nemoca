package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class FindIdResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String nickname = request.getParameter("nickname");
		String tel = request.getParameter("tel");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.findId(nickname, tel);
		
		request.setAttribute("member", member);
		return "findIdResult";
	}

}
