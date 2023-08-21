-- 데이터 게시글 - 가볼만한곳 게시글 좋아요 테이블 생성
create table tbl_likeatt(
    userid varchar2(30) not null
        references tbl_user(userid),
    bno number 
        references tbl_attraction(bno)
);

-- 테이블 조회
select * from tbl_likeatt;

-- 테이블 삭제
drop table tbl_likeatt;

-- 커밋
commit;