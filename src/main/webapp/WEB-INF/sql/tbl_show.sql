-- 데이터 게시글 - 부산 전시 테이블 생성
create table tbl_show(
    bno number primary key,
    showname varchar2(200) not null,
    begindate varchar2(20),
    enddate varchar2(20),
    placename varchar2(80),
    openhours varchar2(150),
    price varchar2(400),
    url varchar2(100),
    viewcnt number default 0,
    replycnt number default 0
);

-- 데이터 게시글 - seq_show_bno 시퀀스 생성
create sequence seq_show_bno
increment by 1
start with 1;

-- 테이블 조회
select * from tbl_show;

-- 테이블 삭제
drop table tbl_show;

-- 시퀀스 삭제
drop sequence seq_show_bno;

-- 테이블 데이터 삭제
delete from tbl_show;

-- 커밋
commit; 