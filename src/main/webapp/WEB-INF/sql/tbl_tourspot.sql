-- 관광지 정보 저장
-- 관광지 번호(참조키), 관광지명, 예상 경비
create table tbl_tourspot(
  tno number primary key,
  cno number references tbl_course(cno),
  place varchar2(100) not null,
  cost number(10) default 0
);

-- 시퀀스 생성 seq_tourspot_tno
create sequence seq_tourspot_tno
increment by 1
start with 1;

-- 테이블 조회
select * from tbl_tourspot;

-- 테이블 삭제
drop table tbl_tourspot;

-- 시퀀스 삭제
drop sequence seq_tourspot_tno;

-- 커밋
commit;