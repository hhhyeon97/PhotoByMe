package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.service.NoticeService;
import com.example.vo.NoticeVO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	
	//관리자 공지 작성
		@RequestMapping("/notice_write")
		public ModelAndView notice_write(HttpServletResponse response,
				HttpSession session,HttpServletRequest request) throws Exception{
			response.setContentType("text/html;charset=UTF-8");

			//if(isAdminLogin(session, response)){
				int page=1;
				if(request.getParameter("page") != null) {
					page=Integer.parseInt(request.getParameter("page"));
				}
				ModelAndView wm=new ModelAndView();
				wm.addObject("page",page);//페이징 목록에서 책갈피 기능을 구현하기 위한것
				wm.setViewName("admin/notice_write");
				return wm;
		}//notice_write()
	
		//관리자 공지 저장
		@RequestMapping("/notice_write_ok")
		public ModelAndView admin_gongji_write_ok(NoticeVO n,HttpSession session,
				HttpServletResponse response) throws Exception{
			  //네임 피라미터 이름과 빈클래스 변수명이 같으면 noticeVO n에서 n객체에 이름,공지제목,비번,공지내용까지 
			 //저장되어 있다.
			response.setContentType("text/html;charset=UTF-8");
			this.noticeService.insertNotice(n);//공지 저장
			return new ModelAndView("redirect:/notice_list");
		}//notice_write_ok()	
		
	
}
