package com.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;
	
	// 아이디 중복 여부 확인
	@Override
	public MemberVO idCheck(String id) {
		return sqlSession.selectOne("idCheck",id);
	}
	//회원 저장 
	@Override
	public void memberJoin(MemberVO m) {
		sqlSession.insert("memberJoin",m);
	}
	//비밀번호 찾기
	@Override
	public MemberVO pwdMember(MemberVO m) {
		return sqlSession.selectOne("pwFind",m);
	}
	//임시비번 발급
	@Override
	public void updatePwd(MemberVO m) {
		sqlSession.update("pwEdit",m);
	}
	//로그인
	@Override
	public MemberVO loginCheck(String mid) {
		return sqlSession.selectOne("loginCheck",mid);
	}

	
}
