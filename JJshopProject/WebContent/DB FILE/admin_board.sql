create table board
(num number primary key,
writer varchar2(10) not null,
email varchar2(30),
subject varchar2(50) not null,
passwd varchar2(12) not null,
reg_date varchar2(10) not null,
readcount number default 0,
content varchar2(4000) not null,
ip varchar2(20) not null,
re_step number,
re_level number,
filename varchar2(20),
filesize number);
create sequence board_num;

