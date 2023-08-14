-- ������ �Խñ� - �λ������� ���̺� ����
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

-- ������ �Խñ� - seq_attraction_bno ������ ����
create sequence seq_attraction_bno
increment by 1
start with 1;

-- ���̺� ��ȸ
select * from tbl_attraction
order by bno asc;

-- �׽�Ʈ ������ ����
insert into tbl_attraction
(bno, title, content, aname, location, lat, along, address, anumber, opendays,
openhours, price, facility, image, thumbimage)
values
(seq_attraction_bno.nextval, 'Ÿ��Ʋ', '����', '������', '����', 20, 30, '���θ�', '����ó', '������', '���½ð�', '����',
'���ǽü�', '�̹���', '�����');

-- ���̺� ����
drop table tbl_attraction;

-- ������ ����
drop sequence seq_attraction_bno;

-- ���̺� ������ ����
delete from tbl_attraction;

-- ������ ���� Ȯ��(byteȮ�ο�)
select max(length(content)) from tbl_attraction;

select length(title) 
from tbl_attraction
where bno = 121;

select * from tbl_attraction
where bno = 121;

-- Ŀ��
commit;

select * from tbl_attraction