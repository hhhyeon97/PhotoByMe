package com.example.service;

import java.util.List;

import com.example.vo.BoardVO;
import com.example.vo.PageVO;

public interface BoardService {

	void insertBoard(BoardVO b);
	int getListCount(PageVO p);
	List<BoardVO> getBoardList(PageVO p);
	BoardVO getBoardCont(int bno);
	BoardVO getBoardCont2(int bno);
	void replyBoard(BoardVO rb);
	void editBoard(BoardVO eb);
	void delBoard(int bno);

}
