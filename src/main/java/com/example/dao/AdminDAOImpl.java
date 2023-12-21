package com.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.vo.AdminVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertAdmin(AdminVO ab) {
		sqlSession.insert("insertAdmin",ab);
	} // 관리자 정보 저장
	@Override
	public AdminVO adminLogin(String aid) {
		return sqlSession.selectOne("loginAdmin",aid);
	} // 관리자 로그인 인증 

	
}
