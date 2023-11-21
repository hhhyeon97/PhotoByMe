package com.example.dao;

import com.example.vo.MemberVO;

public interface MemberDAO {

	MemberVO pwdMember(MemberVO m);

	void updatePwd(MemberVO m);

}
