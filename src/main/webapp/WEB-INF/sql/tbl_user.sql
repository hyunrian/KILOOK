create table tbl_user (
        userid varchar2(15) primary key,
        upw varchar2(15) not null,
        unickname varchar2(30) not null unique,
        upoint number default 0,
        uimg varchar2(300),
        uemail varchar2(40) not null,
        signupfrom varchar2(20) default 'home',
        joindate timestamp default sysdate,
        verified char(1) default 'F' check (verified in('T', 'F'))
);