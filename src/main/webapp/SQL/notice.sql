-- 12/12 공지사항 테이블

create table notice(
    nno number(36) primary key,
    nname varchar2(30) not null,
    ntitle varchar2(100) not null,
    npwd number(30) not null,
    ncont varchar2(1000) not null,
    nhit number(30) not null,
    ndate date
);

-- notice_seq 시퀀스 생성

create sequence notice_seq
start with 1
increment by 1
nocache
nocycle;


select * from notice;

commit;

