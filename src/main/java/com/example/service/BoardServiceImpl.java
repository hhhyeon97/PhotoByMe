package com.example.service;

import java.util.List;

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
	
	
	
	
}
