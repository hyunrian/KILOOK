-- ������ �Խñ� - �������Ѱ� �Խñ� ���ƿ� ���̺� ����
create table tbl_likeatt(
    userid varchar2(30) not null
        references tbl_user(userid),
    bno number 
        references tbl_attraction(bno)
);

-- ���̺� ��ȸ
select * from tbl_likeatt;

-- ���̺� ����
drop table tbl_likeatt;

-- Ŀ��
commit;