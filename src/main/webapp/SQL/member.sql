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



-- 1202 이메일 도메인 컬럼 추가 

alter table member01 add memail2 varchar2(30) not null;
-- not null인 컬럼을 추가할려면 테이블이 비어있어야 함. 
-- 테이블 초기화 후 다시 시도하면 성공 ! 
TRUNCATE TABLE member01;

select * from member01 order by mdate desc;

--  memail2 를 memail뒤로 오게 컬럼 순서 변경 ! 
ALTER TABLE member01 MODIFY adminCk INVISIBLE;
ALTER TABLE member01 MODIFY mdate INVISIBLE;

ALTER TABLE member01 MODIFY adminCk VISIBLE;
ALTER TABLE member01 MODIFY mdate VISIBLE;

commit;


