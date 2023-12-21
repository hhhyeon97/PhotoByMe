package com.example.dao;

import com.example.vo.AdminVO;

public interface AdminDAO {

	void insertAdmin(AdminVO ab);
	AdminVO adminLogin(String aid);


}
