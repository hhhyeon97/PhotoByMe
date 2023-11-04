package com.example.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.service.MemberService;
import com.example.vo.MemberVO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	
	@Autowired
	private MemberService memberservice;
	
	//회원가입 페이지 이동
		@RequestMapping(value = "/join", method = RequestMethod.GET)
		public void loginGET() {
			
			logger.info("회원가입 페이지 진입");
		}
		
		//회원가입
		@RequestMapping(value="/join_ok", method=RequestMethod.POST)
		public String join_ok(MemberVO member,Model model) throws Exception{
			
			logger.info("join 진입");
			
			// 회원가입 서비스 실행
			memberservice.memberJoin(member);
			
			logger.info("join Service 성공");
			
			 model.addAttribute("regSuccess", true);
			 
			return "redirect:/member/login";
		}	
		
		//로그인 페이지 이동
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public void joinGET() {
			logger.info("로그인 페이지 진입");
		}
		
		

		// 아이디 중복 검사
		@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
		@ResponseBody
		public String memberIdChk(String mid) throws Exception{

			logger.info("memberIdChk() 진입");

			int result = memberservice.idCheck(mid);

			logger.info("결과값 = " + result);

			if(result != 0) {

				return "fail";	// 중복 아이디가 존재

			} else {

				return "success";	// 중복 아이디 x

			}
		} // memberIdChk() 종료	

			
}
