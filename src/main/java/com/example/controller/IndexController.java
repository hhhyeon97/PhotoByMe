package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class IndexController {

	@GetMapping("/index")
	public String home() {
		return "index";
	}
	
	@GetMapping("/cart")
	public String cart() {
		return "cart";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/search")
	public String search() {
		return "search";
	}
	
	@GetMapping("/product")
	public String product() {
		return "product";
	}
	
	@GetMapping("/join")
	public String join() {
		return "join";
	}
	
}
