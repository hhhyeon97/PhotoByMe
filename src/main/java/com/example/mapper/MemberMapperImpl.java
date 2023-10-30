package com.example.mapper;

import org.springframework.stereotype.Repository;

import com.example.vo.MemberVO;


@Repository
public class MemberMapperImpl implements MemberMapper {


	
	@Override
	public void memberJoin(MemberVO member) {
		// 잠만... 회원 정보 입력하면 메인페이지로 가는 것 까지는 반환되는데 
		// db에 저장이 안 되고 있고 membermapper만 만들고  membermapperimpl역할을
		// memberMapper.xml이 대체한다고 하는데... 이게 뭘까 ?/.,.,.,..?다시다시해보자
		// 그리고  root-context.xml 이거에서 설정해줘야 하는게 있는 듯!!! 다시 찾아보기 
		
	}

}
