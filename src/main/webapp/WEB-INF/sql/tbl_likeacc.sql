-- ������ �Խñ� - ���� �Խñ� ���ƿ� ���̺� ����
create table tbl_likeacc(
    userid varchar2(30) not null
        references tbl_user(userid),
    bno number 
        references tbl_acc(bno)
);

-- ���̺� ��ȸ
select * from tbl_likeacc;

-- ���̺� ����
drop table tbl_likeacc;

-- Ŀ��
commit;