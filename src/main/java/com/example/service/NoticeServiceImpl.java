package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.NoticeDAO;
import com.example.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDao;

	@Override
	public void insertNotice(NoticeVO n) {
		noticeDao.insertNotice(n);
	}
	
	
	
}
