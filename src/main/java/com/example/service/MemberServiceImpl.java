package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.MemberDAO;
import com.example.vo.MemberVO;


@Service
public class MemberServiceImpl implements MemberService {


	@Autowired
	private MemberDAO memberDao;
	

	@Override
	public MemberVO idCheck(String id) {
		return memberDao.idCheck(id);
	}
	
	@Override
	public void memberJoin(MemberVO m) {
		 memberDao.memberJoin(m);
	}

	@Override
	public MemberVO pwdMember(MemberVO m) {
		
		return this.memberDao.pwdMember(m);
	}

	@Override
	public void updatePwd(MemberVO m) {
		this.memberDao.updatePwd(m);
	}

	@Override
	public MemberVO loginCheck(String mid) {
		return memberDao.loginCheck(mid);
	}



	
	
}
