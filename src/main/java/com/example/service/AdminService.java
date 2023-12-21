package com.example.service;

import java.util.List;

import com.example.vo.AdminVO;
import com.example.vo.BoardVO;
import com.example.vo.MemberVO;
import com.example.vo.PageVO;

public interface AdminService {
	
	// 관리자 인증 
	void insertAdmin(AdminVO ab);
	AdminVO adminLogin(String aid);
	// 관리자 회원 관리 
	int getListCount(PageVO p); // 회원 목록 수 
	List<MemberVO> getMemberList(PageVO p);
	MemberVO getMember(String mid);
	void editMember(MemberVO m);
	void deleteMem(String mid);
	// 관리자 QnA 관리 
	int getListCount2(PageVO p); // 공지사항 목록 수 
	List<BoardVO> getBoardList(PageVO p);
	void insertBoard(BoardVO b);
	BoardVO getAdminBoardCont(int bno);
	void editBoard(BoardVO eb);


}
