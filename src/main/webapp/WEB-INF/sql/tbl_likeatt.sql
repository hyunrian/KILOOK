-- ������ �Խñ� - �������Ѱ� �Խñ� ���ƿ� ���̺� ����
create table tbl_likeatt(
    unickname varchar2(30) not null
        references tbl_user(unickname),
    bno number 
        references tbl_attraction(bno)
);

-- ���̺� ��ȸ
select * from tbl_likeatt;

-- ���̺� ����
drop table tbl_likeacc;

-- Ŀ��
commit;