-- ������ �Խñ� - ������ �Խñ� ���ƿ� ���̺� ����
create table tbl_likerest(
    unickname varchar2(30) not null
        references tbl_user(unickname),
    bno number 
        references tbl_rest(bno)
);

create table tbl_likerest(
    unickname varchar2(30) not null,
       
    bno number 
        references tbl_rest(bno)
);

-- ���̺� ��ȸ
select * from tbl_likerest;

-- ���̺� ����
drop table tbl_likerest;

-- Ŀ��
commit;