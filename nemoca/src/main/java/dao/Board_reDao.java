package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Board;
import model.Board_re;

public class Board_reDao {
	private static Board_reDao instance = new Board_reDao();

	private Board_reDao() {
	}

	public static Board_reDao getInstance() {
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

	// BoardView.java 각 게시글의 댓글 수
	public int count(int b_no) {
		return (int) session.selectOne("board_rens.count", b_no);
	}

	// BoardView.java 각 게시글의 댓글 목록
	public List<Board_re> list(int b_no) {
		return session.selectList("board_rens.list", b_no);
	}

	// BoardReplyWrite.java 댓글 입력
	public int insert(Board_re board_re) {
		int num = (int) session.selectOne("board_rens.selectbr_re_no");
		if (board_re.getBr_re_no() != 0) { // 답글일 때
			session.update("board_rens.updatebr_ref", board_re);
			board_re.setBr_ref_step(board_re.getBr_ref_step() + 1);
			board_re.setBr_ref_level(board_re.getBr_ref_level() + 1);
		} else { // 답글 아닐 때(그냥 댓글)
			board_re.setBr_ref(num);
		}
		return session.insert("board_rens.insert", board_re);
	}

	// BoardReplyDelete.java 댓글 삭제
	public int delete(int br_re_no) {
		return session.update("board_rens.delete", br_re_no);
	}
	
	public Board_re select(int br_re_no) {
		return (Board_re) session.selectOne("board_rens.select", br_re_no);
	}

	// BoardReplyUpdate.java 댓글 수정
	public int update(Board_re board_re) {
		return session.update("board_rens.update", board_re);
	}

	// BdLikesCnt.java (좋아요수 +1)
	public void likesPlus(int br_re_no) {
		session.update("board_rens.likesPlus", br_re_no);
	}

	// BdLikesCnt.java (좋아요수 -1)
	public void likesMinus(int br_re_no) {
		session.update("board_rens.likesMinus", br_re_no);
	}

	public int selectLikes(int br_re_no) {
		return (int) session.selectOne("board_rens.selectLikes", br_re_no);
	}
	
	public List<Board_re> myPage(String user_id) {
		// TODO Auto-generated method stub
		return session.selectList("board_rens.myPage", user_id);
	}

	// 다른 테이블에서 user_id를 활용한 user_img찾기
	public String selectUser_img(String user_id) {
		// TODO Auto-generated method stub
		return (String) session.selectOne("memberns.selectUser_img", user_id);
	}
	
	
	
}
