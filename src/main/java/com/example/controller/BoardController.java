package com.example.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.service.BoardService;
import com.example.vo.BoardVO;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	//게시판 입력폼 매핑
	@RequestMapping(value="/board_write", method=RequestMethod.GET)
	public String board_write(HttpServletRequest request,
			Model m) {
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		m.addAttribute("page",page);//키,값 쌍으로 쪽번호 저장
		return "board/board_write";//WEB-INF/views/board/
		//board_write.jsp 뷰페이지 경로와 파일명
	}//board_write()
	
	//게시판 저장
		@RequestMapping(value="/board_write_ok",
				method=RequestMethod.POST)
		//POST방식으로 접근하는 매핑주소를 처리
		public ModelAndView board_write_ok(
				@ModelAttribute BoardVO b) {
			//@ModelAttribute BoardVO b라고 하면 네임피라미터 이름과
			//빈클래스 변수명이 같으면 b객체에 값이 벌써 저장됨.
			this.boardService.insertBoard(b);//게시판 저장
			return new ModelAndView("redirect:/board_list");
			//board_list로 이동
		}//board_write_ok()
	

}
