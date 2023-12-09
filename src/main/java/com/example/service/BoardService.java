package com.example.service;

import java.util.List;

import com.example.vo.BoardVO;
import com.example.vo.PageVO;

public interface BoardService {

	void insertBoard(BoardVO b);
	int getListCount(PageVO p);
	List<BoardVO> getBoardList(PageVO p);

}
