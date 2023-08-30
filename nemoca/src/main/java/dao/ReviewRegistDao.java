package dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Cafe;

public class ReviewRegistDao {
	private static ReviewRegistDao instance = new ReviewRegistDao();

	public static ReviewRegistDao getInstance() {
		return instance;
	}

	private static SqlSession session;

	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
//			openSession(true) : 입력/삭제/수정 후에 commit
			session = ssf.openSession(true);
			reader.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public int update(Cafe cafe) {
		return session.update("cafe.updateCafe", cafe);
	}
	public Cafe select(int c_no) {
		
		return (Cafe) session.selectOne("cafe.selectOne", c_no);
	}
	public List<Cafe> list() {
		String userid = "master";		
		return session.selectList("caferanking.cafeRankingList", userid);
	}
}
