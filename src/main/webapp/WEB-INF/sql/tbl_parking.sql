-- 데이터 게시글 - 부산 관광소 테이블 생성
create table tbl_parking(
    bno number primary key,
    pname varchar2(100) not null,
    lat number(20),
    plong number(20),
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

-- 데이터 게시글 - seq_info_bno 시퀀스 생성
create sequence seq_parking_bno
increment by 1
start with 1;

-- 테이블 조회(지번 주소 또는 도로명 주소 중 null이 아닌 데이터로 조회)
select * from tbl_parking;



-- 테스트 데이터 삽입
insert into tbl_parking
(bno, pname, lat, plong, jibunaddress, doroaddress, weekdayopen, weekdayclose, saturdayopen,
saturdayclose, holidayopen, holidayclose, price)
values
(seq_parking_bno, '주차장', 20, 30, null, '도로명', '00:00', '23:59', '00:00', '23:59', '00:00', '23:59', 1000);

-- 테이블 삭제


-- 시퀀스 삭제


-- 테이블 데이터 삭제


-- 데이터 길이 확인(byte확인용)

-- 커밋
commit;