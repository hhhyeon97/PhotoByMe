package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.AdminDAO;
import com.example.vo.AdminVO;
import com.example.vo.BoardVO;
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
	public MemberVO getMember2(String mid) {
		return adminDao.getMember2(mid);
	}
	@Override
	public void editMember(MemberVO m) {
		adminDao.editMember(m);
	}
	@Override
	public void deleteMem(String mid) {
		adminDao.deleteMem(mid);
	}
	
	//==================관리자 공지사항 관리 ==============
	@Override
	public int getListCount2(PageVO p) {
		return adminDao.getListCount2(p);
	}
	@Override
	public List<BoardVO> getBoardList(PageVO p) {
		return adminDao.getBoardList(p);
	}
	@Override
	public void insertBoard(BoardVO b) {
		adminDao.insertBoard(b);
	}
	@Override
	public BoardVO getAdminBoardCont(int bno) {
		return adminDao.getAdminBoardCont(bno);
	}
	@Override
	public void editBoard(BoardVO eb) {
		adminDao.editBoard(eb);
	}
	@Override
	public void deleteBoard(int no) {
		adminDao.deleteBoard(no);
	}
	


	
}
