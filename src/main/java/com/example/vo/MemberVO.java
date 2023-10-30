package com.example.vo;

public class MemberVO {

	
	private String mid; //회원 아이디
	private String mpw; //회원 비번
	private String mname; //회원이름
	private String memail; // 회원 이메일
	private String mAddr1; //회원 주소	
	private String mAddr2; //회원 주소
	private String mAddr3; //회원 상세주소
	private int adminCk; // 관리자 구분 (0:일반 사용자/1:관리자)
	private int mdate; // 등록 일자
	
	
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getmAddr1() {
		return mAddr1;
	}
	public void setmAddr1(String mAddr1) {
		this.mAddr1 = mAddr1;
	}
	public String getmAddr2() {
		return mAddr2;
	}
	public void setmAddr2(String mAddr2) {
		this.mAddr2 = mAddr2;
	}
	public String getmAddr3() {
		return mAddr3;
	}
	public void setmAddr3(String mAddr3) {
		this.mAddr3 = mAddr3;
	}
	public int getAdminCk() {
		return adminCk;
	}
	public void setAdminCk(int adminCk) {
		this.adminCk = adminCk;
	}
	public int getMdate() {
		return mdate;
	}
	public void setMdate(int mdate) {
		this.mdate = mdate;
	}
}


