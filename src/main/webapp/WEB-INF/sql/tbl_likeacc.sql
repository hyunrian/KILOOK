-- 데이터 게시글 - 숙박 게시글 좋아요 테이블 생성
create table tbl_likeacc(
    userid varchar2(30) not null
        references tbl_user(userid),
    bno number 
        references tbl_acc(bno)
);

-- 테이블 조회
select * from tbl_likeacc;

-- 테이블 삭제
drop table tbl_likeacc;

-- 커밋
commit;