-- ������ �Խñ� - ��� �Խñ� ��� ���̺� ����
 create table tbl_attreply(
    rno number primary key,
    bno number references tbl_attraction(bno),
    replytext varchar2(1000) not null,
    replyer varchar2(30) not null
        references tbl_user(unickname),
    regdate timestamp default sysdate,
    updatedate timestamp,
    rgroup number not null,                                                                      
    rseq number default 0 not null ,
    rlevel number default 0 not null,
    delete_yn varchar2(2) default 'n',
    unickname varchar2(50) references tbl_user(unickname),
    userid varchar2(50) references tbl_user(userid)
);

-- ������ �Խñ� - seq_attreply_rno ������ ����
create sequence seq_attreply_rno
increment by 1
start with 1;

-- ���̺� ��ȸ
select * from tbl_attreply
order by rno desc;

-- ������ ���� Ȯ��
select count(*) from tbl_attreply;

-- �׽�Ʈ ������ ����
-- rgroup : ��� �׷�
-- rseq : ������ rlevel���� ���� �� ����
-- rlevel : � ��ۿ� ���� ������� Ȯ�� (0�ƴϸ� 1, ������ �鿩���⸦ ���ϰ� ���̵� �������)
insert into tbl_attreply
    (rno, bno, replytext, replyer, rgroup, rseq, rlevel)
values
    (seq_reply_rno.nextval, 1, '�ؽ�Ʈ', 'test00', 1, 1, 1);

-- ���̺� ����
drop table tbl_attreply;

-- ������ ����
drop sequence seq_attreply_rno;

-- ���̺� ������ ����
delete from tbl_attreply;

-- Ŀ��
commit;

rollback;