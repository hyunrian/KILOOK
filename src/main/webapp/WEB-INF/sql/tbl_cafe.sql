-- ���̺� ���� �� ������ ������ Developer���� import�� ó����

-- ���̺� ��ȸ
select * from tbl_cafe;

select * from tbl_cafe
where bno >= 1800 and bno <= 1900
order by bno asc;

-- �÷� �߰�
alter table tbl_cafe add aviewcnt number default 0;
alter table tbl_cafe add areplycnt number default 0;

-- Ŀ��
commit;


