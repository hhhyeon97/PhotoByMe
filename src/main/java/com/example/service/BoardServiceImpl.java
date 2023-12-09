package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.BoardDAO;
import com.example.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDao;

	@Override
	public void insertBoard(BoardVO b) {
		boardDao.insertBoard(b);
	}
	
	
	
	
}
