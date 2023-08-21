-- 데이터 게시글 - 음식점 게시글 좋아요 테이블 생성
create table tbl_likerest(
    userid varchar2(30) not null
        references tbl_user(userid),
    bno number 
        references tbl_rest(bno)
);

-- 테이블 조회
select * from tbl_likerest;

-- 테이블 삭제
drop table tbl_likerest;

-- 커밋
commit; 