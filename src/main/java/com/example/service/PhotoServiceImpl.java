package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.PhotoDAO;
import com.example.vo.PhotoVO;

@Service
public class PhotoServiceImpl implements PhotoService {

	@Autowired
	private PhotoDAO photoDao;

	@Override
	public void insertPhoto(PhotoVO p) {
		photoDao.insertPhoto(p);
	}



}
