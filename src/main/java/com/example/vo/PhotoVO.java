package com.example.vo;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter 
@Getter 
@ToString 
@Entity // 엔티티빈 JPA
@Table(name="photo") 
@EqualsAndHashCode(of="pno")
public class PhotoVO {
	
	@Id
	private int pno; //이미지 번호 
	//private String mid; // 멤버 테이블과 연결
	private String purl; // 이미지 경로
	private String ptitle; //이미지 제목
	@CreationTimestamp
	private Timestamp pdate; //등록 날짜  
	
}
