package dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Board;

public class BoardDao {
	private static BoardDao instance = new BoardDao();
	private BoardDao() {
		
	}
	public static BoardDao getInstance() {
		return instance;
	}
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch(IOException e) {
			e.printStackTrace();
		}
	}	
	public Board select(int b_no) {
		// TODO Auto-generated method stub
		return (Board) session.selectOne("boardns.select", b_no);
	}

	public int insert(Board board) {
		// TODO Auto-generated method stub
//		System.out.println("b_subject="+board.getB_subject());
//		System.out.println("b_content="+board.getB_content());
//		System.out.println("b_img1="+board.getB_img1());
//		System.out.println("b_user_id="+board.getUser_id());
		return session.insert("boardns.insert", board);
	}
	public int getTotal() {
		// TODO Auto-generated method stub
		return (int) session.selectOne("boardns.getTotal");
	}
	
	public int getTotalB() {
		return (int) session.selectOne("boardns.getTotalB");
	}
	public void readcountUpdate(int b_no) {
		session.update("boardns.readcountUpdate", b_no);
	}
	
	public List<Board> list(int startRow, int endRow) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow",startRow);
		map.put("endRow", endRow);
		return session.selectList("boardns.list",map);
	}
	public List<Board> list2(int startRow, int endRow) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow",startRow);
		map.put("endRow", endRow);
		return session.selectList("boardns.list2",map);
	}
	public List<Board> list3(int startRow, int endRow) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow",startRow);
		map.put("endRow", endRow);
		return session.selectList("boardns.list3",map);
	}
	
	public List<Board> list4(int startRow, int endRow) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow",startRow);
		map.put("endRow", endRow);
		return session.selectList("boardns.list4",map);
	}
	
	
	public int delete(int b_no) {
		// TODO Auto-generated method stub
		return session.update("boardns.delete", b_no);
	}
	public int update(Board board) {
		// TODO Auto-generated method stub
		return session.update("boardns.update", board);
	}
	public int likesMinus(int b_no) {
		// TODO Auto-generated method stub
		return session.update("boardns.likesMinus", b_no);
	}
	public int likesPlus(int b_no) {
		// TODO Auto-generated method stub
		return session.update("boardns.likesPlus", b_no);
	} 
	public List<Board> myPage(String user_id) {
		return session.selectList("boardns.myPage", user_id);
	}
	public List<Board> search(String srch) {
		// TODO Auto-generated method stub
		return session.selectList("boardns.search", srch);
	}

}
