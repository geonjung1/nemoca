package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class ConfirmId implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String user_id = request.getParameter("user_id");
		String msg = "";
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(user_id);
		if(member==null)
			msg = "사용 가능한 아이디 입니다.";
		else
			msg = "이미 사용중인 아이디 입니다.";
		request.setAttribute("msg", msg);
		return "confirmId";
	}

}
