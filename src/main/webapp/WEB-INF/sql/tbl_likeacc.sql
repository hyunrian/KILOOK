-- ������ �Խñ� - ���� �Խñ� ���ƿ� ���̺� ����
create table tbl_likeacc(
    unickname varchar2(30) not null
        references tbl_user(unickname),
    bno number 
        references tbl_acc(bno)
);

create table tbl_likeacc(
    unickname varchar2(30) not null,
       
    bno number 
        references tbl_acc(bno)
);

-- ���̺� ��ȸ
select * from tbl_likeacc;

-- ���̺� ����
drop table tbl_likeacc;

-- Ŀ��
commit;