-- ������ �Խñ� - ������ �Խñ� ��� ���̺� ����
 create table tbl_restreply(
    rno number primary key,
    bno number references tbl_rest(bno),
    replytext varchar2(1000) not null,
    
    replyer varchar2(30) not null
        references tbl_user(unickname),
    regdate timestamp default sysdate,
    updatedate timestamp,
    
    rgroup number not null,
    rseq number not null,
    rlevel number not null,
    delete_yn varchar2(2) default 'n',
    userid varchar2(15) references tbl_user(userid)
);

-- ������ �Խñ� - seq_rest_bno ������ ����
create sequence seq_reply_rno
increment by 1
start with 1;

-- ���̺� ��ȸ
select * from tbl_restreply
order by rno desc;

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