--시퀀스
create sequence seq1;
--테이블
create table myinfo(num number(5) primary key, name varchar2(20), addr varchar2(30), sdate date);print_table

select * from myinfo;


create sequence seq_myshop;

--테이블 (MyShop)
create table myshop(num number(5) primary key, sangpum varchar2(20), su number(5), price number(5), ipgo date);

select * from myshop;

create sequence seq_stu;

create table mystudent(stu_num number(5) primary key, stu_name varchar2(20), stu_grade number(5), hp varchar2(20), addr varchar2(30), age number(5), sdate date);
select * from mystudent;

select * from sawon;