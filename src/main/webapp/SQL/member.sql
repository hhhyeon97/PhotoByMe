--10/30

--회원 가입 테이블 member 

create table member(
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

select * from member;

commit;



select * from member order by mdate desc;

alter table member drop column mAddr1; -- 주소1,2,3 삭제 

insert into member values('admin01', 'admin', '관리자', 'admin',1, sysdate);

delete from member;








