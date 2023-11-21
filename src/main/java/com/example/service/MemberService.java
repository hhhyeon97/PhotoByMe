package com.example.service;

import com.example.vo.MemberVO;

public interface MemberService {

	//회원가입
		public void memberJoin(MemberVO member) throws Exception;
	// 아이디 중복 체크
		public int idCheck(String mid) throws Exception;
		
	// 비밀번호 찾기	
	public MemberVO pwdMember(MemberVO m);
	//임시 비번 발급
	public void updatePwd(MemberVO m);
	// 로그인 인증 
	public MemberVO loginCheck(String mid);


}
