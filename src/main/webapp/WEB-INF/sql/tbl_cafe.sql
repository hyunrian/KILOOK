-- ���̺� ���� �� ������ ������ Developer���� import�� ó����

-- ���̺� ��ȸ
select * from tbl_cafe;

-- �÷� �߰�
alter table tbl_cafe add aviewcnt number default 0;
alter table tbl_cafe add areplycnt number default 0;

-- Ŀ��
commit;