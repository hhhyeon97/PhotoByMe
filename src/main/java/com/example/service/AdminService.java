package com.example.service;

import com.example.vo.AdminVO;

public interface AdminService {
	
	
	void insertAdmin(AdminVO ab);
	AdminVO adminLogin(String aid);


}
