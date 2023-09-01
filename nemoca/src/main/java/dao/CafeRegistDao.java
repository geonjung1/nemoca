package dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Cafe;

public class CafeRegistDao {
	private static CafeRegistDao instance = new CafeRegistDao();

	public static CafeRegistDao getInstance() {
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

	public Integer selectMaximumCafeNumber() {
		Integer cafeNumber = (int)session.selectOne("cafe.selectMaximumCafeNumber");
		
		return cafeNumber;
	}

	public int insertCafe(Cafe cafe) {
		return session.insert("cafe.insertCafe", cafe);
	}
	
}
