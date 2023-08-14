create table tbl_userreply(
    rno number primary key,
    bno number references tbl_userboard(bno),
    replytext varchar2(1000) not null,
    replyer varchar2(50) references tbl_user(unickname),
    regdate timestamp default sysdate,
    updatedate timestamp,
    rgroup number not null,
    rseq number not null,
    rlevel number not null,
    delete_yn char(1) default 'N',
    parentreplyer varchar2(50) references tbl_user(unickname)
);

create sequence seq_userreply_rno;