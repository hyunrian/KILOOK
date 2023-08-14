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

-- 데이터 게시글 - seq_info_bno 시퀀스 생성
create sequence seq_parking_bno
increment by 1
start with 1;

-- 테이블 조회
select * from tbl_parking
where bno >= 600 and bno <= 650
order by bno asc;

select * from tbl_parking;

select pname, jibunaddress, doroaddress, weekdayopen, weekdayclose, saturdayopen, saturdayclose, holidayopen, holidayclose, price, replycnt
from tbl_parking;

-- 테스트 데이터 삽입
-- 지번 없고 도로명 있는 데이터
insert into tbl_parking
(bno, pname, lat, plong, jibunaddress, doroaddress, weekdayopen, weekdayclose, saturdayopen,
saturdayclose, holidayopen, holidayclose, price)
values
(seq_parking_bno.nextval, '주차장', 20, 30, null, '도로명', '00:00', '23:59', '00:00', '23:59', '00:00', '23:59', '1000');

-- 도로명 없고 지번 있는 데이터
insert into tbl_parking
(bno, pname, lat, plong, jibunaddress, doroaddress, weekdayopen, weekdayclose, saturdayopen,
saturdayclose, holidayopen, holidayclose, price)
values
(seq_parking_bno.nextval, '주차장', 20, 30, '지번', null, '00:00', '23:59', '00:00', '23:59', '00:00', '23:59', '1000');

-- 테이블 삭제
drop table tbl_parking;

-- 시퀀스 삭제
drop sequence seq_parking_bno;

-- 테이블 데이터 삭제
delete from tbl_parking;

-- 커밋
commit;