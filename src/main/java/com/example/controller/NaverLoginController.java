package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NaverLoginController {

	
	
    //=====================api 테스트 ===============================
	//네이버 로그인 
	@GetMapping("/login_naver")
	public ModelAndView login_naver() {
		return new ModelAndView("/member/login_naver");
	}
    
	
	
}
