package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mapper.MemberMapper;
import com.example.vo.MemberVO;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper membermapper;

	@Override
	public void memberJoin(MemberVO member) throws Exception {
		
		membermapper.memberJoin(member);
		
	}

	@Override
	public int idCheck(String mid) throws Exception {
		return membermapper.idCheck(mid);
	}
	
	
}
