package dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Cafe;
import model.Cafe_re;

public class CafeReviewModifyDao {
	private static CafeReviewModifyDao instance = new CafeReviewModifyDao();

	public static CafeReviewModifyDao getInstance() {
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

	public Cafe_re selectCafeReview(String cr_no, String c_no) {
		Cafe_re cafeReview = new Cafe_re();
		cafeReview.setCr_no(Integer.parseInt(cr_no));
		cafeReview.setC_no(Integer.parseInt(c_no));
		
		return (Cafe_re)session.selectOne("cafereview.selectCafeReview", cafeReview);
	}

	public int updateCafeReview(Cafe_re cafeReview) {
		return session.insert("cafereview.updateCafeReview", cafeReview);
	}
}
