package com.example.dao;

import java.util.List;

import com.example.vo.BoardVO;
import com.example.vo.PageVO;

public interface BoardDAO {

	void insertBoard(BoardVO b);
	int getListCount(PageVO p);
	List<BoardVO> getBoardList(PageVO p);

}
