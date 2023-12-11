package com.example.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class NoticeVO {
	
	private int nno;
	private String nname;
	private String ntitle;
	private String npwd;
	private String ncont;
	private int nhit;
	private Date ndate;
	
}
