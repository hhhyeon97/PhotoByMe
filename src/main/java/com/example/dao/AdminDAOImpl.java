package com.example.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.vo.AdminVO;
import com.example.vo.BoardVO;
import com.example.vo.MemberVO;
import com.example.vo.PageVO;

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
	
	@Override
	public int getListCount(PageVO p) {
		return sqlSession.selectOne("amCount",p);
	}
	@Override
	public List<MemberVO> getMemberList(PageVO p) {
		return sqlSession.selectList("amList",p);
	}
	@Override
	public MemberVO getMember(String mid) {
		return sqlSession.selectOne("amInfo",mid);
	}
	
	@Transactional
	@Override
	public void editMember(MemberVO m) {
		sqlSession.update("amUpdate",m);
	}
	@Override
	public void deleteMem(String mid) {
		sqlSession.delete("amDelete",mid);
	}
	@Override
	public int getListCount2(PageVO p) {
		return sqlSession.selectOne("abCount",p);
	}
	@Override
	public List<BoardVO> getBoardList(PageVO p) {
		return sqlSession.selectList("abList",p);
	}

	
}
