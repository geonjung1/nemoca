package service.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class Update implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		// 앞 주소(이전)
		String prevUrl = request.getParameter("prevUrl");

		String user_id = request.getParameter("user_id");
		String nickname = request.getParameter("nickname");
		String tel = request.getParameter("tel");
		String pass = request.getParameter("pass");
		int age = Integer.parseInt(request.getParameter("age"));
		
		Member member = new Member();
		member.setUser_id(user_id);
		member.setNickname(nickname);
		member.setTel(tel);
		member.setPass(pass);
		member.setAge(age);		
		
		MemberDao md = MemberDao.getInstance();
		int result = md.update(member);
			
		request.setAttribute("result", result);
		request.setAttribute("prevUrl", prevUrl);
		return "update";
	}

}