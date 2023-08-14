-- 여행 코스 게시글 정보 저장
-- 게시글 번호, 제목, 총 경비, 메모장, 작성자, 작성일, 업데이트일, 몇일 차
create table tbl_course(
    cno number primary key,
    title varchar2(300) not null,
    totalcost number(10) default 0,
    content varchar2(3000),
    writer varchar2(30) not null
        references tbl_user(unickname),
    regdate timestamp default sysdate,
    updatedate timestamp,
    dayCount number(10) not null
);

-- 시퀀스 생성 seq_course_cno 
create sequence seq_course_cno
increment by 1
start with 1;

-- 테이블 조회
select * from tbl_course;

-- 테이블 삭제
drop table tbl_course;

-- 시퀀스 삭제
drop sequence seq_course_cno;

-- 커밋
commit;