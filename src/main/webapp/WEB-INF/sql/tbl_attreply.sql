-- 데이터 게시글 - 명소 게시글 댓글 테이블 생성
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
    delete_yn varchar2(2) default 'N',
    unickname varchar2(50) references tbl_user(unickname),
    userid varchar2(50) references tbl_user(userid)
);

-- 데이터 게시글 - seq_attreply_rno 시퀀스 생성
create sequence seq_attreply_rno
increment by 1
start with 1;

-- 테이블 조회
select * from tbl_attreply
order by rno desc;

-- 데이터 개수 확인
select count(*) from tbl_attreply;

-- 테스트 데이터 삽입
insert into tbl_attreply
    (rno, bno, replytext, replyer, rgroup, rseq, rlevel)
values
    (seq_reply_rno.nextval, 1, '텍스트', 'test00', 1, 1, 1);

-- 테이블 삭제
drop table tbl_attreply;

-- 시퀀스 삭제
drop sequence seq_attreply_rno;

-- 테이블 데이터 삭제
delete from tbl_attreply;

-- 커밋
commit;

rollback;