package dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Cafe;
import model.Cafe_re;

public class CafeReviewDeleteDao {
	private static CafeReviewDeleteDao instance = new CafeReviewDeleteDao();

	public static CafeReviewDeleteDao getInstance() {
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

	public int deleteCafeReview(Cafe_re cafeReview) {
		return session.insert("cafereview.deleteCafeReview", cafeReview);
	}
}
