drop database  baemindb;

create database baemindb;

use baemindb;

create table member
(
no int(5) primary key auto_increment,
id varchar(20) not null unique,
pw varchar(20) not null,
name varchar(30) not null,
tel varchar(20) not null,
addr varchar(60) not null,
addr2 varchar(60) not null,
regDate date,
grade int(2),
memberX double,
memberY double
);


insert into member (id, pw, name, tel, addr, addr2, regdate, grade, memberX, memberY)
values ('admin','admin','관리자', '010-1234-1234' ,'서울 구로구 구로중앙로34길 33-4','경영 기술 개발원 401호','2000-01-01'
,3 ,126.884660819027,37.5009565732326);

select * from member;


create table shop
(
shopNo int(4) primary key  auto_increment,
shopName varchar(30) not null,
shopCategory text not null,
shopEx text,
shopAddr varchar(60) not null,
shopAddr2 varchar(60),
shopTel varchar(20) not null,
shopX double ,
shopY double ,
shopStatus int(4) default 0
);


create table menu
(
menuNo int(4) primary key auto_increment,
menuShopNo int(4) not null,
menuName varchar(30) not null,
menuCategory varchar(30) not null,
menuEx text,
menuPrice int(7) not null,
menuStatus int(4) default 0
);


create table orderlist (
no int(4) primary key auto_increment,
shopNo int(4),
name varchar(20),
nameNo int(4),
orderDate datetime,
status int(4) default 0,
orderList text  ,
completeTime datetime,
whyCancel text,
addr varchar(60),
addr2 varchar(60)
);


	

create table notice
(
no int(4) primary key auto_increment,
title varchar(60) not null,
content text,
startDate date,
endDate date
);


create table review
(
reviewNo int(4) primary key auto_increment,
reviewShopNo int(4) not null,
reviewOrderNo int(4) not null,
reviewerNo  int(4) not null,
reviewContent text,
reviewRank int(2) default 0,
reviewDate datetime
);





desc member;
desc shop;
desc menu;
desc orderlist;
desc notice;
desc review;


show tables;
;