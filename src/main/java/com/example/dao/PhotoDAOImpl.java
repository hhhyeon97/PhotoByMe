package com.example.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.vo.PhotoVO;

@Repository
public class PhotoDAOImpl implements PhotoDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PhotoRepository photoRepo;

	@Override
	public void insertPhoto(PhotoVO p) {
		sqlSession.insert("uploadPhoto",p);
	}
	
}
