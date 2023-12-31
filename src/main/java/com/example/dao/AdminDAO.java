package com.example.dao;

import java.util.List;

import com.example.vo.AdminVO;
import com.example.vo.BoardVO;
import com.example.vo.MemberVO;
import com.example.vo.PageVO;

public interface AdminDAO {

	void insertAdmin(AdminVO ab);
	AdminVO adminLogin(String aid);
	
	int getListCount(PageVO p);
	List<MemberVO> getMemberList(PageVO p);
	MemberVO getMember2(String mid);
	void editMember(MemberVO m);
	void deleteMem(String mid);
	
	int getListCount2(PageVO p);
	List<BoardVO> getBoardList(PageVO p);
	void insertBoard(BoardVO b);
	BoardVO getAdminBoardCont(int bno);
	void editBoard(BoardVO eb);
	void deleteBoard(int no);


}
