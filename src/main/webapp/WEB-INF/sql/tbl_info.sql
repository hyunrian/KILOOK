-- 데이터 게시글 - 부산 관광소 테이블 생성
create table tbl_info(
    bno number primary key,
    iname varchar2(100),
    openhours varchar2(25),
    inumber varchar2(15),
    lat number(20),
    ilong number(20),
    address varchar2(100),
    language varchar2(50),
    introduce varchar2(1100),
    viewcnt number default 0,
    replycnt number default 0
);

-- 데이터 게시글 - seq_info_bno 시퀀스 생성
create sequence seq_info_bno
increment by 1
start with 1;

-- 테이블 조회
select * from tbl_info
where iname is not null
order by bno asc;

-- 테스트 데이터 삽입
insert into tbl_info
	(bno, iname, openhours, inumber, lat, ilong, address, language, introduce)
values
	(seq_info_bno.nextval, '안내소이름', '운영시간', '전화번호', 20, 30, '주소', '한국어', '안내소소개');

-- 테이블 삭제
drop table tbl_info;

-- 시퀀스 삭제
drop sequence seq_info_bno;

-- 테이블 데이터 삭제
delete from tbl_info;

-- 커밋
commit;