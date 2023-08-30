package dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Cafe;
import model.Cafe_re;

public class CafeReviewRegistDao {
	private static CafeReviewRegistDao instance = new CafeReviewRegistDao();

	public static CafeReviewRegistDao getInstance() {
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

	public Integer selectMaximumCafeReviewNumber(String c_no) {
		Cafe_re cafeReview = new Cafe_re();
		cafeReview.setC_no(Integer.parseInt(c_no));
		
		Integer cafeReviewNumber = (int)session.selectOne("cafereview.selectMaximumCafeReviewNumber", cafeReview);
		if(cafeReviewNumber == null) {
			return null;
		}
		
		return cafeReviewNumber;
	}

	public int insertCafeReview(Cafe_re cafeReview) {
		return session.insert("cafereview.insertCafeReview", cafeReview);
	}
	
}
