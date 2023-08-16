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
    delete_yn varchar2(2) default 'n',
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

-- 테스트 데이터 삽입
-- rgroup : 댓글 그룹
-- rseq : 동일한 rlevel에서 대댓글 내 순서
-- rlevel : 어떤 댓글에 대한 대댓인지 확인 (0아니면 1, 대댓글은 들여쓰기를 안하고 아이디만 명시해줌)
insert into tbl_restreply
    (rno, bno, replytext, replyer, rgroup, rseq, rlevel)
values
    (seq_reply_rno.nextval, 1, '텍스트', 'test00', 1, 1, 1);

-- 테이블 삭제
drop table tbl_accreply;

-- 시퀀스 삭제
drop sequence seq_accreply_rno;

-- 테이블 데이터 삭제
delete from tbl_accreply;

-- 커밋
commit;

rollback;