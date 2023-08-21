-- 데이터 게시글 - 음식점 게시글 댓글 테이블 생성
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

-- 데이터 게시글 - seq_restreply_rno 시퀀스 생성
CREATE SEQUENCE seq_restreply_rno INCREMENT BY 1 START WITH 1;

-- 테이블 조회
select * from tbl_restreply
order by rno desc;

-- 데이터 개수 확인
select count(*) from tbl_restreply;

-- 테이블 삭제
drop table tbl_restreply;

-- 시퀀스 삭제
drop sequence seq_restreply_rno;

-- 테이블 데이터 삭제
delete from tbl_restreply;

-- 커밋
commit; 