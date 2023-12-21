package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.AdminDAO;
import com.example.vo.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDao;

	@Override
	public void insertAdmin(AdminVO ab) {
		adminDao.insertAdmin(ab);
	}
	@Override
	public AdminVO adminLogin(String aid) {
		return adminDao.adminLogin(aid);
	}

	
}
