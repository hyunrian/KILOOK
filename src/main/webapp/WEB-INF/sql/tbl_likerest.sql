-- ������ �Խñ� - ������ �Խñ� ���ƿ� ���̺� ����
create table tbl_likerest(
    userid varchar2(30) not null
        references tbl_user(userid),
    bno number 
        references tbl_rest(bno)
);

-- ���̺� ��ȸ
select * from tbl_likerest;

-- ���̺� ����
drop table tbl_likerest;

-- Ŀ��
commit; 