-- ������ �Խñ� - ������ �Խñ� ��� ���̺� ����
 create table tbl_restreply(
    rno NUMBER PRIMARY KEY,
    bno NUMBER
        REFERENCES tbl_rest ( bno ),
    replytext VARCHAR2(1000) NOT NULL,
    replyer VARCHAR2(30) NOT NULL
        REFERENCES tbl_user ( unickname ),
    regdate TIMESTAMP DEFAULT SYSDATE,
    updatedate TIMESTAMP,
    rgroup NUMBER NOT NULL,
    rseq NUMBER DEFAULT 0 NOT NULL,
    rlevel NUMBER DEFAULT 0 NOT NULL,
    delete_yn VARCHAR2(2) DEFAULT 'N',
    unickname   VARCHAR2(50)
        REFERENCES tbl_user ( unickname ),
    userid VARCHAR2(50)
        REFERENCES tbl_user ( userid )
);

-- ������ �Խñ� - seq_restreply_rno ������ ����
CREATE SEQUENCE seq_restreply_rno INCREMENT BY 1 START WITH 1;

-- ���̺� ��ȸ
select * from tbl_restreply
order by rno desc;

-- ������ ���� Ȯ��
select count(*) from tbl_restreply;

-- ���̺� ����
drop table tbl_restreply;

-- ������ ����
drop sequence seq_restreply_rno;

-- ���̺� ������ ����
delete from tbl_restreply;

-- Ŀ��
commit; 