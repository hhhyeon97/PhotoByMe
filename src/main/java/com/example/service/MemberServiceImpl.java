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
	public void join_ok(MemberVO m) {
		 memberDao.join_ok(m);
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

	@Override
	public MemberVO getMember(String mid) {
		return memberDao.getMember(mid);
	}

	@Override
	public void updateMember(MemberVO m) {
		memberDao.updateMember(m);
	}

	@Override
	public void delMember(MemberVO dm) {
		memberDao.delMember(dm);
	}



	
	
}
