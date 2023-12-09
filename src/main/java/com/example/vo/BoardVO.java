package com.example.vo; 

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter //setter() 메서드 자동 제공
@Getter //getter() 메서드 자동 제공
@ToString //toString() 메서드 자동 제공 
@Entity // 엔티티빈 JPA
@Table(name="Board01") // 테이블명
@EqualsAndHashCode(of="bno")
public class BoardVO {// jpa 방식으로 db 생성

	
	@Id
	private int bno; // 기본키 
	
	private String bname;
	private String btitle;
	private String bcont;
	private int bhit;
	private Timestamp bdate;
	
	
}
