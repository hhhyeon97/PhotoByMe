package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.NoticeDAO;
import com.example.vo.NoticeVO;
import com.example.vo.PageVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDao;

	@Override
	public void insertNotice(NoticeVO n) {
		noticeDao.insertNotice(n);
	}
	@Override
	public int getListCount(PageVO p) {
		return noticeDao.getListCount(p);
	}
	@Override
	public List<NoticeVO> getNoticeList(PageVO p) {
		return noticeDao.getNoticeList(p);
	}
	@Override
	public NoticeVO getNoticeCont(int no) {
		return noticeDao.getNoticeCont(no);
	}
	@Override
	public void editNotice(NoticeVO n) {
		noticeDao.editNotice(n);
	}
	@Override
	public void delNotice(int no) {
		noticeDao.delNotice(no);
	}
	
	
	
}
