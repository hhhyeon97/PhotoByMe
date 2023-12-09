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
	
	
	
	private int bref; //글 그룹번호 => 원본글과 답변글을 묶어주기
	private int bstep; //원본글과 답변글을 구분하는 번호값이면 몇번째 답변글인지 알려주기
						// 원본 글이면 0, 첫번째 답변글이면 1, 두번째 답변글이면 2
	private int blevel; //답변글 정렬 순서
	
}
