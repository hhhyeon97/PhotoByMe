
-- 12/13 photo 테이블 생성 

create table photo(
    pno number(36) primary key, -- 이미지 번호 
    mid varchar2(38) references member01(mid),  -- 멤버 테이블과 외래 키 연결 
    purl varchar2(255) not null,    -- 이미지 경로
    ptitle varchar2(30) not null, -- 이미지 제목
    pdate date -- 등록 날짜 
);


select * from photo;
delete from photo where pno=0;
drop table photo; -- 외래키 제약조건 걸려 있어서 x
drop table photo cascade constraints; -- 외래키 제약 조건 걸린 테이블 삭제 
commit;

-- 찜한 목록 my저장소 테이블

create table  myRepo (
    repoid varchar2(38) primary key,
    mid  varchar2(38) REFERENCES member01(mid), -- member01 테이블과의 외래 키 연결
    pno NUMBER REFERENCES photo(pno), -- photo 테이블과의 외래 키 연결
    mydate date
);

select * from myRepo;


