-- ������ ���� ����
-- ������ ��ȣ(����Ű), ��������, ���� ���
create table tbl_tourspot(
  tno number primary key,
  cno number references tbl_course(cno),
  place varchar2(100) not null,
  cost number(10) default 0
);

-- ������ ���� seq_tourspot_tno
create sequence seq_tourspot_tno
increment by 1
start with 1;

-- ���̺� ��ȸ
select * from tbl_tourspot;

-- ���̺� ����
drop table tbl_tourspot;

-- ������ ����
drop sequence seq_tourspot_tno;

-- Ŀ��
commit;