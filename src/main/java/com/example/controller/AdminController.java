package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	//관리자 로그인 페이지
	@GetMapping("/admin_login")
	public ModelAndView admin_login() {
		return new ModelAndView("admin/admin_login");
	}//admin_login()

	
}
