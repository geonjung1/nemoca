package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class LoginAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String user_id = request.getParameter("user_id");
		String pass = request.getParameter("pass");
		
		MemberDao md = MemberDao.getInstance();
		int result = 0;
		Member member = md.select(user_id);
		if (member == null || member.getDel().equals("y"))
			result = -1; /* 없는 아이디 */
		else if (member.getPass().equals(pass)) {
			HttpSession session = request.getSession();
			session.setAttribute("user_id", user_id);
			result = 1;
		}
		else
			result = 0;
			
		request.setAttribute("result", result);
		return "login";
	}

}
