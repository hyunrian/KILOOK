-- ������ �Խñ� - �λ� ���� ���̺� ����
create table tbl_show(
    bno number primary key,
    showname varchar2(200) not null,
    begindate varchar2(20),
    enddate varchar2(20),
    placename varchar2(80),
    openhours varchar2(150),
    price varchar2(400),
    url varchar2(100),
    viewcnt number default 0,
    replycnt number default 0
);

-- ������ �Խñ� - seq_show_bno ������ ����
create sequence seq_show_bno
increment by 1
start with 1;

-- ���̺� ��ȸ
select * from tbl_show
where bno >= 2600 and bno <= 2650
order by bno asc;

select * from tbl_show;

-- �׽�Ʈ ������ ��ü ��ȸ
select showname, begindate, enddate, placename, replycnt
from tbl_show
order by bno desc;

-- �׽�Ʈ ������ ����
insert into tbl_show
(bno, showname, begindate, enddate, placename, openhours, price, url)
values
(seq_show_bno.nextval, '��������', '���ý�����', '����������', '�ü���', '���� �ð�', '����', 'Ȩ������ url');

-- ���̺� ����
drop table tbl_show;

-- ������ ����
drop sequence seq_show_bno;

-- ���̺� ������ ����
delete from tbl_show;

-- Ŀ��
commit;