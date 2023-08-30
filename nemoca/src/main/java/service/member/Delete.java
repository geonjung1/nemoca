package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import service.CommandProcess;

public class Delete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		int result = 0;
		
		MemberDao md = MemberDao.getInstance();
		if (user_id.equals("master")) {
			user_id = request.getParameter("user_id");
			result = md.delete(user_id);
		}
		else {
			if (user_id != null) {
				user_id = (String)session.getAttribute("user_id");
				result = md.delete(user_id);
				if (result > 0)
					session.invalidate();
			}
		}
		request.setAttribute("result", result);
		return "delete";
	}

}
