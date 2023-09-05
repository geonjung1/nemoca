package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class Update implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// member 생성
		Member member = new Member();
		
		// 앞 주소(이전)
		String prevUrl = request.getParameter("prevUrl");
		
		MultipartRequest multi = null;
		String user_id = null;
		
		// 프로필 파일 업로드 & 용량설정 (10MB)
		int fileMaxSize = 10 * 1024 * 1024;
		String savePath = request.getServletContext().getRealPath("/upload");
		
		try {
			multi = new MultipartRequest(request, savePath, fileMaxSize,  "UTF-8", new DefaultFileRenamePolicy());
			user_id = multi.getParameter("user_id");
			String user_img = multi.getFilesystemName("user_img");
			String nickname = multi.getParameter("nickname");
			String tel = multi.getParameter("tel");
			String pass = multi.getParameter("pass");
			int age = Integer.parseInt(multi.getParameter("age"));
			
			// member에 수정내용 세팅
			
			member.setUser_id(user_id);
			member.setUser_img(user_img);
			member.setNickname(nickname);
			member.setTel(tel);
			member.setPass(pass);
			member.setAge(age);	
			
			
		} catch (Exception e) {
			request.getSession().setAttribute("messageType", "오류 메세지");
			request.getSession().setAttribute("messageContent", "파일 크기는 10MB를 넘을수 없습니다.");
		}
		
		// session에서 user_id 가져오기
		HttpSession session = request.getSession();
		user_id = (String) session.getAttribute("user_id");

		// MemberDao 생성 및 update
		MemberDao md = MemberDao.getInstance();
		int result = md.update(member);
		
		request.setAttribute("member", member);
		request.setAttribute("user_id", user_id);
		request.setAttribute("result", result);
		request.setAttribute("prevUrl", prevUrl);
		return "update";
	}

}