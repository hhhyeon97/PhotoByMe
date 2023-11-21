--10/30

--회원 가입 테이블 member -- > 11/21 member01로 변경  

create table member01(
    mid varchar2(38) primary key
    ,mpw varchar2(50) not null
    ,mname varchar2(50) not null
    ,memail VARCHAR2(100) NOT NULL
    ,mAddr1 VARCHAR2(100) NOT NULL
    ,mAddr2 VARCHAR2(100) NOT NULL
    ,mAddr3 VARCHAR2(100) NOT NULL
    ,adminCk NUMBER NOT NULL
    ,mdate DATE NOT NULL
);

select * from member01;

-- test01 임시 비번 80249
commit;

alter table member01 drop column mAddr3; -- 주소1,2,3 삭제 

insert into member01 values('admin01', 'admin', '관리자', 'admin',1, sysdate);

--11/21 회원 테스트 
insert into member01 values('test01', 'Test123!', '지현', 'test01@naver.com',0, sysdate);









