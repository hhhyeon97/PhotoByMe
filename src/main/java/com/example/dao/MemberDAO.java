package com.example.dao;

import com.example.vo.MemberVO;

public interface MemberDAO {
	
	MemberVO idCheck(String id);
	void join_ok(MemberVO m);
	MemberVO pwdMember(MemberVO m);
	void updatePwd(MemberVO m);
	MemberVO loginCheck(String mid);



}
