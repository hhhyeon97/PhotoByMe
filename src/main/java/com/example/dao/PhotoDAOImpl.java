package com.example.dao;

import java.util.List;

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
	public List<PhotoVO> getAllPhotos() {
		return photoRepo.findAll();
	}

	@Override
	public void uploadPhoto(PhotoVO photo) {
		photoRepo.save(photo);
	}
	
}
