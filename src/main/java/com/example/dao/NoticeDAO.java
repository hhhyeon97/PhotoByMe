package com.example.dao;

import java.util.List;

import com.example.vo.NoticeVO;
import com.example.vo.PageVO;

public interface NoticeDAO {

	void insertNotice(NoticeVO n);
	int getListCount(PageVO p);
	List<NoticeVO> getNoticeList(PageVO p);
	NoticeVO getNoticeCont(int no);
	void editNotice(NoticeVO n);
	void delNotice(int no);
	List<NoticeVO> getUserNoticeList();
	void updateHit(int nno);
	NoticeVO getUserNoticeCont(int nno);

}
