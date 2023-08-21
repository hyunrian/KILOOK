-- ������ �Խñ� - �λ� ������ ���̺� ����
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

-- ������ �Խñ� - seq_parking_bno������ ����
create sequence seq_parking_bno
increment by 1
start with 1;

-- ���̺� ��ȸ
select * from tbl_parking;

-- ���̺� ����
drop table tbl_parking;

-- ������ ����
drop sequence seq_parking_bno;

-- ���̺� ������ ����
delete from tbl_parking;

-- Ŀ��
commit;