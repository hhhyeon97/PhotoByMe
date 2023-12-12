package com.example.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.vo.NoticeVO;
import com.example.vo.PageVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertNotice(NoticeVO n) {
		sqlSession.insert("notice_in",n);
	}

	@Override
	public int getListCount(PageVO p) {
		return sqlSession.selectOne("listCount2",p);
	}

	@Override
	public List<NoticeVO> getNoticeList(PageVO p) {
		return sqlSession.selectList("notice_li",p);
	}

	@Override
	public NoticeVO getNoticeCont(int no) {
		return sqlSession.selectOne("notice_co",no);
	}

	@Override
	public void editNotice(NoticeVO n) {
		sqlSession.update("notice_ed",n);
	}

	@Override
	public void delNotice(int no) {
		sqlSession.delete("notice_del",no);
	}

	@Override
	public List<NoticeVO> getUserNoticeList() {
		return sqlSession.selectList("user_notice_li");
	}

	@Override
	public void updateHit(int nno) {
		sqlSession.update("noticeHit",nno);
	}
	
	@Override
	public NoticeVO getUserNoticeCont(int nno) {
		return sqlSession.selectOne("user_notice_co",nno);
	}

	
	
}
