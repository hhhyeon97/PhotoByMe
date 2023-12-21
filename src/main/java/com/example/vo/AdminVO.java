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
@Entity
@Table(name="admin")
@EqualsAndHashCode(of="aid")
public class AdminVO {
	
	private int ano;
	@Id 
	private String aid;
	
	private String apw;
	private String aname;
	// mybatis에선 x
	@CreationTimestamp
	private Timestamp adate; 
}
