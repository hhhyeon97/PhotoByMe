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
	
	
}
