-- ������ �Խñ� - ������ ���̺� ����
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

-- ������ �Խñ� - seq_rest_bno ������ ����
create sequence seq_rest_bno
increment by 1
start with 1;

-- ���̺� ��ȸ
select * from tbl_rest
order by bno asc;

-- ������ ���� Ȯ��
select count(*) from tbl_rest;

-- �׽�Ʈ ������ ����
insert into tbl_rest
(bno, rname, content, location, address, rnumber, url, openhours, menu, lat, rlong, image, thumbimage)
values
(3000,'������', '����Ʈ', '��ġ', '�ּ�', '1234', 'url', '11', '�޴�', 123, 456, '�̹���1', '�����');

-- ���̺� ����
drop table tbl_rest;

-- ������ ����
drop sequence seq_rest_bno;

-- ���̺� ������ ����
delete from tbl_rest;

-- Ŀ��
commit;