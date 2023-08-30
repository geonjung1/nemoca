package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Member;

public class MemberDao {
	private static MemberDao instance = new MemberDao();

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		return instance;
	}

	private static SqlSession session; // mybatis를 사용할 객체
	// 초기화 블럭(자바 5장 75page) 멤버변수 값 초기화에 사용
	// {}를 쓰면 인스탄스 초기화블럭, static{} 클래그 초기화 블럭
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public Member select(String user_id) {
		return (Member) session.selectOne("memberns.select", user_id);
	}

	public int insert(Member member) {
		return session.insert("memberns.insert", member);
	}

	public Member confirmNick(String nickname) {
		return (Member) session.selectOne("memberns.confirmNick", nickname);
	}

	public int update(Member member) {
		return session.update("memberns.update", member);
	}

	public int delete(String user_id) {
		return session.delete("memberns.delete", user_id);
	}

	public Member findId(String nickname, String tel) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("nickname", nickname);
		hm.put("tel", tel);
		return (Member) session.selectOne("memberns.findId", hm);
	}

	public Member findPass(String nickname, String user_id) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("nickname", nickname);
		hm.put("user_id", user_id);
		return (Member) session.selectOne("memberns.findPass", hm);
	}
}
