-- ���� �ڽ� �Խñ� ���� ����
-- �Խñ� ��ȣ, ����, �� ���, �޸���, �ۼ���, �ۼ���, ������Ʈ��, ���� ��
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

-- ������ ���� seq_course_cno 
create sequence seq_course_cno
increment by 1
start with 1;

-- ���̺� ��ȸ
select * from tbl_course;

-- ���̺� ����
drop table tbl_course;

-- ������ ����
drop sequence seq_course_cno;

-- Ŀ��
commit;