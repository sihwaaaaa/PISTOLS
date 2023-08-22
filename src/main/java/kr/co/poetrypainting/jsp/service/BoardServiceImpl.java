package kr.co.poetrypainting.jsp.service;

import java.util.List;

import kr.co.poetrypainting.jsp.dao.BoardDao;
import kr.co.poetrypainting.jsp.dao.ReplyDao;
import kr.co.poetrypainting.jsp.domain.Board;
import kr.co.poetrypainting.jsp.domain.Criteria;

public class BoardServiceImpl implements BoardService {
	private BoardDao dao = new BoardDao();
	private ReplyDao replyDao = new ReplyDao();
	@Override
	public Long register(Board board) {
		//글 작성 후 글번호 지정
		Long bno = (long)dao.insert(board);
		//
		return bno;
	}

	@Override
	public Board get(Long bno) {
		dao.increaseHitCount(bno);
		Board board = dao.selectOne(bno);
		return board;
	}

	@Override
	public List<Board> list(Criteria cri) {
		return dao.selectList(cri);

	}

	@Override
	public void modify(Board board) {
		dao.update(board);
	}

	@Override
	public void remove(Long bno) {
			
		//댓글 삭제
		replyDao.deleteBoard(bno);
		//tbl_board삭제
		dao.delete(bno);
	}
	@Override
	public int listCount(Criteria cri) {
		return dao.selectListCount(cri);
	}
}
