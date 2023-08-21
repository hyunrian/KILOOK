-- 데이터 게시글 - 부산 관광소 테이블 생성
create table tbl_parking(
    bno number primary key,
    pname varchar2(100) not null,
    lat varchar2(20),
    plong varchar2(20),
    jibunaddress varchar2(150),
    doroaddress varchar2(150),
    weekdayopen varchar2(50),
    weekdayclose varchar2(50),
    saturdayopen varchar2(50),
    saturdayclose varchar2(50),
    holidayopen varchar2(50),
    holidayclose varchar2(50),
    price varchar2(20),
    viewcnt number default 0,
    replycnt number default 0
);

-- 데이터 게시글 - seq_parking_bno시퀀스 생성
create sequence seq_parking_bno
increment by 1
start with 1;

-- 테이블 조회
select * from tbl_parking;

-- 테이블 삭제
drop table tbl_parking;

-- 시퀀스 삭제
drop sequence seq_parking_bno;

-- 테이블 데이터 삭제
delete from tbl_parking;

-- 커밋
commit;