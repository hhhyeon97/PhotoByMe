package com.example.dao;

import java.util.List;

import com.example.vo.BoardVO;
import com.example.vo.PageVO;

public interface BoardDAO {

	void insertBoard(BoardVO b);
	int getListCount(PageVO p);
	List<BoardVO> getBoardList(PageVO p);
	BoardVO getBoardCont(int bno);
	void updateHit(int bno);
	void updateLevel(BoardVO rb);
	void replyBoard(BoardVO rb);
	void editBoard(BoardVO eb);
	void delBoard(int bno);
	
}
