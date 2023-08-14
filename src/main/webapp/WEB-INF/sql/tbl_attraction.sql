-- 데이터 게시글 - 부산명소정보 테이블 생성
create table tbl_attraction(
    bno number primary key,
    title varchar2(300),
    content clob,
    aname varchar2(300) not null,
    location varchar2(100),
    lat number(20),
    along number(20),
    address varchar2(400),
    anumber varchar2(200),
    opendays varchar2(500),
    openhours varchar2(500),
    price varchar2(500),
    facility varchar2(500),
    image varchar2(500),
    thumbimage varchar2(500),
    viewcnt number default 0,
    replycnt number default 0
);

-- 데이터 게시글 - seq_attraction_bno 시퀀스 생성
create sequence seq_attraction_bno
increment by 1
start with 1;

-- 테이블 조회
select * from tbl_attraction
order by bno asc;

-- 테스트 데이터 삽입
insert into tbl_attraction
(bno, title, content, aname, location, lat, along, address, anumber, opendays,
openhours, price, facility, image, thumbimage)
values
(seq_attraction_bno.nextval, '타이틀', '내용', '관광지', '구군', 20, 30, '도로명', '연락처', '오픈일', '오픈시간', '가격',
'편의시설', '이미지', '썸네일');

-- 테이블 삭제
drop table tbl_attraction;

-- 시퀀스 삭제
drop sequence seq_attraction_bno;

-- 테이블 데이터 삭제
delete from tbl_attraction;

-- 데이터 길이 확인(byte확인용)
select max(length(content)) from tbl_attraction;

select length(title) 
from tbl_attraction
where bno = 121;

select * from tbl_attraction
where bno = 121;

-- 커밋
commit;

select * from tbl_attraction