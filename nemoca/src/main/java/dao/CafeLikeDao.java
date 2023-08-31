package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Cafe_like;
import service.cafe.CafeLike;

public class CafeLikeDao {
	private static CafeLikeDao instance = new CafeLikeDao();

	private CafeLikeDao() {
	}

	public static CafeLikeDao getInstance() {
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

	public void doCafeLike(String c_no, String user_id, String like_yn) {
		Map<String,String> paramMap = new HashMap<String,String>();
		paramMap.put("c_no", c_no);
		paramMap.put("user_id", user_id);
		
		if("Y".equals(like_yn)) {
			session.update("cafe.doLike", paramMap);
		}else{
			session.update("cafe.doUnlike", paramMap);
		}
	}

	public List<Cafe_like> myPage(String user_id) {
		// TODO Auto-generated method stub
		return session.selectList("cafe.myPage", user_id);
	}
}
