package com.example.mapper;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.vo.MemberVO;


@Repository
public class MemberMapperImpl implements MemberMapper {

	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void memberJoin(MemberVO member) {
		sqlSession.insert("memberJoin",member);
	}

	@Override
	public int idCheck(String mid) {
		return sqlSession.selectOne("idCheck",mid);
	}

}
