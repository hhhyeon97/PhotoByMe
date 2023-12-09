

--1210 Board01 테이블 생성 ( 게시판 )

create table Board01(
    bno number(10) primary key,
    bname varchar2(30) not null,
    bcont varchar2(500) not null,
    btitle varchar2(100) not null,
    bhit number(38) default 0,
    bdate date
);


create sequence board_seq
start with 1
increment by 1
nocache
nocycle;

select * from Board01;

commit;

delete from Board01;

ALTER TABLE Board01 DROP COLUMN board_step;
