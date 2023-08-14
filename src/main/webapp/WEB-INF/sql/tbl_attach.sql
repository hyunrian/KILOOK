create table tbl_attach(
	image1 varchar2(150), 
	image2 varchar2(150),
	image3 varchar2(150), 
	image4 varchar2(150),
	image5 varchar2(150),
	bno number references tbl_userboard(bno) 
);