package com.example.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.BoardDAO;
import com.example.vo.BoardVO;
import com.example.vo.PageVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDao;

	@Override
	public void insertBoard(BoardVO b) {
		boardDao.insertBoard(b);
	}

	@Override
	public int getListCount(PageVO p) {
		return this.boardDao.getListCount(p);
	}

	@Override
	public List<BoardVO> getBoardList(PageVO p) {
		return boardDao.getBoardList(p);
	}

	//스프링 AOP를 통한 트랜잭션 적용 대상
	@Transactional
	@Override
	public BoardVO getBoardCont(int bno) {
		this.boardDao.updateHit(bno);
		return boardDao.getBoardCont(bno);
	}

	@Override
	public BoardVO getBoardCont2(int board_no) {
		return this.boardDao.getBoardCont(board_no);
	}

	@Override
	public void replyBoard(BoardVO rb) {
		boardDao.updateLevel(rb);//답변 레벨 증가
		boardDao.replyBoard(rb);//답변 저장
		//답변 저장이 실패되면 답변 레벨 증가도 트랜잭션을 적용해서 롤백 처리를 해야 한다.
		//즉 쿼리문 실행 취소를 시켜야한다.
		
	}

	@Override
	public void editBoard(BoardVO eb) {
		 boardDao.editBoard(eb);
	}

	@Override
	public void delBoard(int bno) {
		boardDao.delBoard(bno);
	}
	
	
	
	
}
