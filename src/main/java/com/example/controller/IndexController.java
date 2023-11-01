package com.example.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class IndexController {

	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	
	// 메인 페이지 이동 1. spring 최신 버전에서 쓰이는 형식 -> 이 형식이 더 간결하고 가독성이 좋은 듯!!
	//   --- > 추가적으로 requestMapping일 때 get/post 명시 안 해주면 인식 잘 안 할 때가 있음 !! 2번 방식처럼 명시해주는 이유가 있는 듯!!!
	/*
	@GetMapping("/index")
	public String home() {
		return "index";
	}
	*/
	
	//메인 페이지 이동 2. 예전 버전들에서 쓰이는 전통 형식 -> 1번 방법에 비해 좀 더 길지만 기존 형식도 알고 싶으므로 이 방법도 익숙해지기
		@RequestMapping(value = "/index", method = RequestMethod.GET)
		public void mainPageGET() {
			logger.info("메인 페이지 진입");
		}
	
	@GetMapping("/cart")
	public String cart() {
		return "cart";
	}
	
	@GetMapping("/search")
	public String search() {
		return "search";
	}
	
	@GetMapping("/product")
	public String product() {
		return "product";
	}
	

	
}
