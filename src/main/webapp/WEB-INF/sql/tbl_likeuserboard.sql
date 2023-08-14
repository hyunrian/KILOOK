create table tbl_likeuserboard(
	unickname varchar2(30) not null, references tbl_user(unickname)
	bno number references not null, tbl_userboard(bno)
);