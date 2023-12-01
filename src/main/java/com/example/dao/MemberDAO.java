package com.example.dao;

import com.example.vo.MemberVO;

public interface MemberDAO {
	
	MemberVO idCheck(String mid);

	MemberVO pwdMember(MemberVO m);

	void updatePwd(MemberVO m);

	MemberVO loginCheck(String mid);


}
