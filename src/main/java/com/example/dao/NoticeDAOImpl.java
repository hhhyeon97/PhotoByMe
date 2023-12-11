package com.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertNotice(NoticeVO n) {
		sqlSession.insert("notice_in",n);
	}
	
	
}
