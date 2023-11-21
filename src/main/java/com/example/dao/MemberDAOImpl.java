package com.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberVO pwdMember(MemberVO m) {
		return sqlSession.selectOne("pwFind",m);
	}

	@Override
	public void updatePwd(MemberVO m) {
		sqlSession.update("pwEdit",m);
	}
	
}
