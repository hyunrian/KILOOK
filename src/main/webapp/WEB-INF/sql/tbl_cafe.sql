-- ���̺� ���� �� ������ ������ Developer���� import�� ó����

-- ���̺� ��ȸ
select * from tbl_cafe;

select * from tbl_cafe
where bno >= 1800 and bno <= 1900
order by bno asc;

select cname, address, nvl(cnumber, '-') cnumber, image, location
from tbl_cafe
where location like '%������%'
order by bno desc;

delete from tbl_cafe
where bno >= 200 and bno <= 1900;

-- �÷� �߰�
alter table tbl_cafe add aviewcnt number default 0;
alter table tbl_cafe add areplycnt number default 0;

-- Ŀ��
commit; 


