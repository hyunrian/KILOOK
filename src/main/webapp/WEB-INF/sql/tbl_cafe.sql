-- 테이블 생성 및 데이터 삽입은 Developer에서 import로 처리함

-- 테이블 조회
select * from tbl_cafe;

-- 컬럼 추가
alter table tbl_cafe add aviewcnt number default 0;
alter table tbl_cafe add areplycnt number default 0;

-- 커밋
commit;