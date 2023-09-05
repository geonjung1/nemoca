package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Board_like;

public class Board_likeDao {
	private static Board_likeDao instance = new Board_likeDao();
	private Board_likeDao() {
	}
	public static Board_likeDao getInstance() {
		return instance;
	}
	private static SqlSession session;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
			reader.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public int select(String user_id, int b_no) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("user_id", user_id);
		hm.put("b_no", b_no);
		return (int) session.selectOne("board_likens.select", hm);
	}
	
	// BdLikesCnt.java 회원이 게시글 좋아요 클릭
	public int insert(String user_id, int b_no) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("user_id", user_id); 
		hm.put("b_no", b_no);
		return (int) session.insert("board_likens.insert", hm);
	}
	
	// BdLikesCnt.java 회원이 게시글 좋아요 취소
	public int delete(String user_id, int b_no) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("user_id", user_id);
		hm.put("b_no", b_no);
		return (int) session.delete("board_likens.delete", hm);	
	}
	
	public List<Board_like> myPage(String user_id) {
		// TODO Auto-generated method stub
		return session.selectList("board_likens.myPage", user_id);
	}
	

}
