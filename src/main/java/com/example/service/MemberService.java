package com.example.service;

import com.example.vo.MemberVO;

public interface MemberService {

	//회원가입
		public void memberJoin(MemberVO member) throws Exception;
}
