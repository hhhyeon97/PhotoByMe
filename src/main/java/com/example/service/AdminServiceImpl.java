package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.AdminDAO;
import com.example.vo.AdminVO;
import com.example.vo.MemberVO;
import com.example.vo.PageVO;

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
	// ============= 회원 관리 ==============
	@Override
	public int getListCount(PageVO p) {
		return adminDao.getListCount(p);
	}
	@Override
	public List<MemberVO> getMemberList(PageVO p) {
		return adminDao.getMemberList(p);
	}
	@Override
	public MemberVO getMember(String mid) {
		return adminDao.getMember(mid);
	}
	@Override
	public void editMember(MemberVO m) {
		adminDao.editMember(m);
	}
	@Override
	public void deleteMem(String mid) {
		adminDao.deleteMem(mid);
	}

	
}
