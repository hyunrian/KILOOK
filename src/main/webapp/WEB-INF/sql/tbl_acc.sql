-- 데이터 게시글 - 부산 숙박분야 테이블 생성
create table tbl_acc(
    bno number primary key,
    category varchar2(30),
    aname varchar2(100) not null,
    location varchar2(20),
    address varchar2(50),
    addressdetail varchar2(50),
    anumber varchar2(13),
    url varchar2(200),
    lat varchar2(20),
    aclong varchar2(20),
    image varchar2(300),
    aviewcnt number,
    areplycnt number
);

-- 데이터 게시글 - seq_acc_bno 시퀀스 생성
create sequence seq_acc_bno
increment by 1
start with 1;

-- 테이블 조회
select * from tbl_acc
where bno >= 2800 and bno <= 2900
order by bno asc;

select * from tbl_acc
order by bno asc;

-- 테스트 데이터 삽입
insert into tbl_acc
(bno, category, aname, location, address, addressdetail, anumber, url, lat, aclong, image)
values
(seq_acc_bno.nextval, '카테고리', '상호', '구군', '도로명주소', '도로명상세', '전화번호', '홈페이지주소', 20, 30, '이미지');

-- 테이블 삭제
drop table tbl_acc;

-- 시퀀스 삭제
drop sequence seq_acc_bno;

-- 테이블 데이터 삭제
delete from tbl_acc;

-- 데이터 길이 확인(byte확인용)
select max(length(content)) from tbl_acc;

-- 커밋
commit;