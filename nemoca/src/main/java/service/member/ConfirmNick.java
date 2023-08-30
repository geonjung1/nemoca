package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class ConfirmNick implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String nickname = request.getParameter("nickname");
		String msg = "";
//		int result = 0;
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.confirmNick(nickname);
		if (member == null) {
			msg = "사용 가능한 닉네임 입니다.";
	//		result = 1;
		}else {
			msg = "이미 사용중인 닉네임 입니다.";
	//		result = 0;
		}
		request.setAttribute("msg", msg);
	//	request.setAttribute("result", result);
		return "confirmNick";
	}
	
}
