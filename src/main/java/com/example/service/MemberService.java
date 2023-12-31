package com.example.service;

import com.example.vo.MemberVO;

public interface MemberService {

	// 아이디 중복 체크 
	 public MemberVO idCheck(String id);
	// 회원 저장 
	 public void join_ok(MemberVO m);
	// 비밀번호 찾기	
	public MemberVO pwdMember(MemberVO m);
	//임시 비번 발급
	public void updatePwd(MemberVO m);
	// 로그인 
	public MemberVO loginCheck(String mid);
	// 회원 정보 수정 데이터 불러오기 
	public MemberVO getMember(String mid);
	// 회원 정보 수정
	public void updateMember(MemberVO m);
	// 회원 탈퇴 
	public void delMember(MemberVO db_pwd);
	




}
