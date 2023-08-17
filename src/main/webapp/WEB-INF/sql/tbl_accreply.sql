-- 데이터 게시글 - 숙소 게시글 댓글 테이블 생성
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

-- 데이터 게시글 - seq_accreply_rno 시퀀스 생성
create sequence seq_accreply_rno
increment by 1
start with 1;

-- 테이블 조회
select * from tbl_accreply
order by rno desc;

-- 데이터 개수 확인
select count(*) from tbl_accreply;

-- 테이블 삭제
drop table tbl_accreply;

-- 시퀀스 삭제
drop sequence seq_accreply_rno;

-- 테이블 데이터 삭제
delete from tbl_accreply;

-- 커밋
commit;

rollback;