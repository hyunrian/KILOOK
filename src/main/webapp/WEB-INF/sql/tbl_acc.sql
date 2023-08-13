-- ������ �Խñ� - �λ� ���ںо� ���̺� ����
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

-- ������ �Խñ� - seq_acc_bno ������ ����
create sequence seq_acc_bno
increment by 1
start with 1;

-- ���̺� ��ȸ
select * from tbl_acc
where bno >= 2800 and bno <= 2900
order by bno asc;

select * from tbl_acc
order by bno asc;

-- �׽�Ʈ ������ ����
insert into tbl_acc
(bno, category, aname, location, address, addressdetail, anumber, url, lat, aclong, image)
values
(seq_acc_bno.nextval, 'ī�װ�', '��ȣ', '����', '���θ��ּ�', '���θ��', '��ȭ��ȣ', 'Ȩ�������ּ�', 20, 30, '�̹���');

-- ���̺� ����
drop table tbl_acc;

-- ������ ����
drop sequence seq_acc_bno;

-- ���̺� ������ ����
delete from tbl_acc;

-- ������ ���� Ȯ��(byteȮ�ο�)
select max(length(content)) from tbl_acc;

-- Ŀ��
commit;