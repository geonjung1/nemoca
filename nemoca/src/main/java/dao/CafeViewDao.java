package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Cafe;
import model.Cafe_re;

public class CafeViewDao {
	private static CafeViewDao instance = new CafeViewDao();

	private CafeViewDao() {
	}

	public static CafeViewDao getInstance() {
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

	public void updateReadCountOne(Integer c_no) {
		Cafe cafe = new Cafe();
		cafe.setC_no(c_no);
		
		session.update("cafe.updateReadCountOne", cafe);
	}
	
	public List<Cafe_re> selectCafeReviewList(Integer c_no) {
		Cafe_re cafeReview = new Cafe_re();
		cafeReview.setC_no(c_no);
		
		return session.selectList("cafe.selectCafeReviewList", cafeReview);
	}
	public Cafe selectCafe(Integer c_no) {
		Cafe cafe = new Cafe();
		cafe.setC_no(c_no);
		
		return (Cafe)session.selectOne("cafe.selectCafe", cafe);
	}
}
