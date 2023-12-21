package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	
	
	
}
