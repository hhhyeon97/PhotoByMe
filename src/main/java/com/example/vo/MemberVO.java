package com.example.vo;

import java.sql.Date;

public class MemberVO {

	
	private String mid; //회원 아이디
	private String mpw; //회원 비번
	private String mname; //회원이름
	private String memail; // 회원 이메일
	private int adminCk; // 관리자 구분 (0:일반 사용자/1:관리자)
	private Date mdate; // 등록 일자
	private String memail2; // 회원 이메일 도메인
	
	
	
	public String getMemail2() {
		return memail2;
	}
	public void setMemail2(String memail2) {
		this.memail2 = memail2;
	}
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
	
	public int getAdminCk() {
		return adminCk;
	}
	public void setAdminCk(int adminCk) {
		this.adminCk = adminCk;
	}

	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
}


