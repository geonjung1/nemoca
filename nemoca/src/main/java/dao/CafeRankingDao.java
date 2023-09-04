package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Board;
import model.Cafe;
import model.Cafe_like;

public class CafeRankingDao {
	private static CafeRankingDao instance = new CafeRankingDao();

	private CafeRankingDao() {
	}

	public static CafeRankingDao getInstance() {
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

	public List<Cafe> list(String user_id, String rankingType) {
		Cafe cafe = new Cafe();
		cafe.setUser_id(user_id);
		cafe.setC_type(rankingType);
		
		session.clearCache();
		
		return session.selectList("caferanking.cafeRankingList", cafe);
	}

	public List<Cafe> search(String srch) {

		return session.selectList("cafe.search", srch);
	}

}
