-- ������ �Խñ� - �λ� ������ ���̺� ����
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

-- ������ �Խñ� - seq_info_bno ������ ����
create sequence seq_info_bno
increment by 1
start with 1;

-- ���̺� ��ȸ
select * from tbl_info
where iname is not null
order by bno asc;

-- �׽�Ʈ ������ ����
insert into tbl_info
	(bno, iname, openhours, inumber, lat, ilong, address, language, introduce)
values
	(seq_info_bno.nextval, '�ȳ����̸�', '��ð�', '��ȭ��ȣ', 20, 30, '�ּ�', '�ѱ���', '�ȳ��ҼҰ�');

-- ���̺� ����
drop table tbl_info;

-- ������ ����
drop sequence seq_info_bno;

-- ���̺� ������ ����
delete from tbl_info;

-- Ŀ��
commit;