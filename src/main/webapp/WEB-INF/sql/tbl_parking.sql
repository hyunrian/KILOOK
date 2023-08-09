-- ������ �Խñ� - �λ� ������ ���̺� ����
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

-- ������ �Խñ� - seq_info_bno ������ ����
create sequence seq_parking_bno
increment by 1
start with 1;

-- ���̺� ��ȸ(���� �ּ� �Ǵ� ���θ� �ּ� �� null�� �ƴ� �����ͷ� ��ȸ)
select * from tbl_parking;



-- �׽�Ʈ ������ ����
insert into tbl_parking
(bno, pname, lat, plong, jibunaddress, doroaddress, weekdayopen, weekdayclose, saturdayopen,
saturdayclose, holidayopen, holidayclose, price)
values
(seq_parking_bno, '������', 20, 30, null, '���θ�', '00:00', '23:59', '00:00', '23:59', '00:00', '23:59', 1000);

-- ���̺� ����


-- ������ ����


-- ���̺� ������ ����


-- ������ ���� Ȯ��(byteȮ�ο�)

-- Ŀ��
commit;