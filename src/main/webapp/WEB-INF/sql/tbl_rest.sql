-- 데이터 게시글 - 음식점 테이블 생성
create table tbl_rest(
    bno number primary key,
    rname varchar2(300) not null,
    content varchar2(3999),
    location varchar2(100),
    address varchar2(200),
    rnumber varchar2(200),
    url varchar2(200),
    openhours varchar2(500),
    menu varchar2(200),
    lat number(20),
    rlong number(20),
    image varchar2(500),
    thumbimage varchar2(500),
    viewcnt number default 0,
    replycnt number default 0
);

-- 데이터 게시글 - seq_rest_bno 시퀀스 생성
create sequence seq_rest_bno
increment by 1
start with 1;

-- 테이블 조회
select * from tbl_rest
order by bno asc;

-- 데이터 개수 확인
select count(*) from tbl_rest;

-- 테스트 데이터 삽입
insert into tbl_rest
(bno, rname, content, location, address, rnumber, url, openhours, menu, lat, rlong, image, thumbimage)
values
(3000,'가나다', '콘텐트', '위치', '주소', '1234', 'url', '11', '메뉴', 123, 456, '이미지1', '썸네일');

-- 테이블 삭제
drop table tbl_rest;

-- 시퀀스 삭제
drop sequence seq_rest_bno;

-- 테이블 데이터 삭제
delete from tbl_rest;

-- 커밋
commit;