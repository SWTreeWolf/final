create table board(
	seq number(5) primary key,
	title varchar2(200),
	writer varchar2(20),
	contetnt varchar2(2000),
	regdate date default sysdate,
	cnt number(5) default 0
)