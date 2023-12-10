package com.example.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.vo.BoardVO;
import com.example.vo.PageVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertBoard(BoardVO b) {
		this.sqlSession.insert("insertBoard",b);
	}

	@Override
	public int getListCount(PageVO p) {
		return sqlSession.selectOne("listCount",p);
	}

	@Override
	public List<BoardVO> getBoardList(PageVO p) {
		return sqlSession.selectList("board_list",p);
	}

	@Override
	public BoardVO getBoardCont(int bno) {
		return sqlSession.selectOne("board_cont",bno);
	}

	@Override
	public void updateHit(int bno) {
		this.sqlSession.update("board_hit",bno);
	}

	@Override
	public void updateLevel(BoardVO rb) {
		sqlSession.update("reply_up",rb);
	}
	
	@Override
	public void replyBoard(BoardVO rb) {
		sqlSession.insert("reply_in",rb);
		
	}


	
	
}
