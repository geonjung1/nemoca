package service.member;

import java.io.UnsupportedEncodingException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class JoinResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String user_id = request.getParameter("user_id");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String pass = request.getParameter("pass");
		String addr = request.getParameter("addr");
		int age =  Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
					
		Member member = new Member();
		member.setUser_id(user_id);
		member.setName(name);
		member.setNickname(nickname);
		member.setEmail(email);
		member.setTel(tel);
		member.setPass(pass);
		member.setAddr(addr);
		member.setAge(age);
		member.setGender(gender);


		MemberDao md = MemberDao.getInstance();
		Member mem = md.select(user_id);
		int result = 0;
		if (mem == null)
			result=md.insert(member);
		else 
			result = -1;
		request.setAttribute("result", result);
		
		return "joinResult";
	}

} 