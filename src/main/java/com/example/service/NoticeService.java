package com.example.service;

import java.util.List;

import com.example.vo.NoticeVO;
import com.example.vo.PageVO;

public interface NoticeService {

	void insertNotice(NoticeVO n);
	int getListCount(PageVO p);
	List<NoticeVO> getNoticeList(PageVO p);
	NoticeVO getNoticeCont(int no);
	void editNotice(NoticeVO n);
	void delNotice(int no);
	List<NoticeVO> getUserNoticeList();
	NoticeVO getUserNoticeCont(int nno);

}
