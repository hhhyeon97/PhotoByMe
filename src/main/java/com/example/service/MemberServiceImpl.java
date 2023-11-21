package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.MemberDAO;
import com.example.mapper.MemberMapper;
import com.example.vo.MemberVO;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper membermapper;

	@Autowired
	private MemberDAO memberDao;
	
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		
		membermapper.memberJoin(member);
		
	}

	@Override
	public int idCheck(String mid) throws Exception {
		return membermapper.idCheck(mid);
	}

	@Override
	public MemberVO pwdMember(MemberVO m) {
		
		return this.memberDao.pwdMember(m);
	}

	@Override
	public void updatePwd(MemberVO m) {
		this.memberDao.updatePwd(m);
	}
	
	
}
