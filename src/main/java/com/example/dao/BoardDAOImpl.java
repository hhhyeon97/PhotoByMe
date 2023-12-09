package com.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertBoard(BoardVO b) {
		this.sqlSession.insert("insertBoard",b);
	}
	
	
}
