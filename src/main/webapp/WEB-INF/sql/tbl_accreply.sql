-- ������ �Խñ� - ���� �Խñ� ��� ���̺� ����
 create table tbl_accreply(
    rno number primary key,
    bno number references tbl_acc(bno),
    replytext varchar2(1000) not null,
    replyer varchar2(30) not null
        references tbl_user(unickname),
    regdate timestamp default sysdate,
    updatedate timestamp,
    rgroup number not null,                                                                      
    rseq number default 0 not null ,
    rlevel number default 0 not null,
    delete_yn varchar2(2) default 'N',
    unickname varchar2(50) references tbl_user(unickname),
    userid varchar2(50) references tbl_user(userid)
);

-- ������ �Խñ� - seq_accreply_rno ������ ����
create sequence seq_accreply_rno
increment by 1
start with 1;

-- ���̺� ��ȸ
select * from tbl_accreply
order by rno desc;

-- ������ ���� Ȯ��
select count(*) from tbl_accreply;

-- ���̺� ����
drop table tbl_accreply;

-- ������ ����
drop sequence seq_accreply_rno;

-- ���̺� ������ ����
delete from tbl_accreply;

-- Ŀ��
commit;

rollback;