-- ������ �Խñ� - ȸ������ ���̺� ����
create table tbl_user(
    userid varchar2(15) primary key,
    upw varchar2(15) not null,
    unickname varchar2(30) not null,
    upoint number default 0,
    uemail varchar2(40) not null,
    signupfrom varchar2(20) default 'home',
    joindate timestamp(6) default systimestamp,
    verified char(1) default 'F'
        check(verified in('T', 'F')),
    unique(unickname)
);

-- ������ �Խñ� - ������ �Խñ� ��� ���̺� ����
 create table tbl_restreply(
    rno number primary key,
    bno number references tbl_rest(bno),
    replytext varchar2(1000) not null,
    replyer varchar2(50) not null
        references tbl_user(unickname),
    regdate timestamp default sysdate,
    updatedate timestamp,
    rgroup number not null,
    rseq number not null,
    rlevel number not null,
    delete_yn varchar2(2) default 'n'
);

-- ������ �Խñ� - seq_rest_bno ������ ����
create sequence seq_reply_rno
increment by 1
start with 1;

-- ���̺� ��ȸ
select * from tbl_restreply;

-- ������ ���� Ȯ��
select count(*) from tbl_restreply;

-- �׽�Ʈ ������ ����


-- ���̺� ����
drop table tbl_restreply;

-- ������ ����
drop sequence seq_reply_rno;

-- ���̺� ������ ����
delete from tbl_restreply;

-- Ŀ��
commit;


rollback;

select * from tbl_reply