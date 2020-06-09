drop database  baemindb;

create database baemindb;

use baemindb;


        
CREATE TABLE member
(
  no      INT         NOT NULL AUTO_INCREMENT,
  id      VARCHAR(20) NOT NULL,
  pw      VARCHAR(20) NOT NULL,
  name    VARCHAR(30) NOT NULL,
  tel     VARCHAR(20) NOT NULL,
  addr    VARCHAR(60) NOT NULL,
  addr2   VARCHAR(60) NULL    ,
  regDate DATETIME    NOT NULL DEFAULT now(),
  memberX DOUBLE      NOT NULL,
  memberY DOUBLE      NOT NULL,
  grade   INT         NOT NULL DEFAULT 1,
  PRIMARY KEY (no)
);

ALTER TABLE member
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE TABLE menu
(
  no           INT         NOT NULL AUTO_INCREMENT,
  menuName     VARCHAR(30) NOT NULL,
  menuCategory VARCHAR(30) NOT NULL,
  menuEx       TEXT(65535) NULL    ,
  menuPrice    INT         NOT NULL,
  menuStatus   INT         NOT NULL DEFAULT 0,
  shop_no      INT         NOT NULL,
  PRIMARY KEY (no)
);

CREATE TABLE notice
(
  no        INT         NOT NULL AUTO_INCREMENT COMMENT 'AUTO_Increment',
  title     VARCHAR(60) NOT NULL,
  content   TEXT(65535) NULL    ,
  startDate DATE        NULL    ,
  endDate   DATE        NULL    ,
  PRIMARY KEY (no)
);

CREATE TABLE Order_cancel
(
  no           INT         NOT NULL AUTO_INCREMENT,
  whyCancel    VARCHAR(60) NOT NULL,
  orderlist_no INT         NOT NULL COMMENT 'AUTO_Increment',
  PRIMARY KEY (no)
);

CREATE TABLE orderlist
(
  no           INT         NOT NULL AUTO_INCREMENT COMMENT 'AUTO_Increment',
  orderDate    DATETIME    NOT NULL,
  status       INT         NOT NULL DEFAULT 0,
  orderList    TEXT(65535) NOT NULL,
  completeTime DATETIME    NULL    ,
  addr         VARCHAR(60) NOT NULL,
  addr2        VARCHAR(60) NOT NULL,
  shop_no      INT         NOT NULL,
  member_no    INT         NOT NULL,
  PRIMARY KEY (no)
);

CREATE TABLE review
(
  no            INT         NOT NULL AUTO_INCREMENT COMMENT 'AUTO_Increment',
  reviewContent VARCHAR(60) NOT NULL,
  reviewRank    INT         NOT NULL,
  regDate       DATETIME    NOT NULL DEFAULT now(),
  shop_no       INT         NOT NULL,
  member_no     INT         NOT NULL,
  PRIMARY KEY (no)
);

CREATE TABLE shop
(
  no           INT         NOT NULL AUTO_INCREMENT,
  id           VARCHAR(20) NOT NULL,
  pw           VARCHAR(20) NOT NULL,
  shopName     VARCHAR(30) NOT NULL,
  shopCategory VARCHAR(60) NOT NULL,
  shopEx       TEXT(65535) NULL    ,
  shopAddr     VARCHAR(60) NOT NULL,
  shopAddr2    VARCHAR(60) NULL    ,
  shopTel      VARCHAR(20) NOT NULL,
  shopX        DOUBLE      NOT NULL,
  shopY        DOUBLE      NOT NULL,
  shopStatus   INT         NOT NULL DEFAULT 0,
  regDate      DATETIME    NULL     DEFAULT now(),
  grade        INT         NULL     DEFAULT 2,
  PRIMARY KEY (no)
);

ALTER TABLE shop
  ADD CONSTRAINT UQ_id UNIQUE (id);

ALTER TABLE orderlist
  ADD CONSTRAINT FK_member_TO_orderlist
    FOREIGN KEY (member_no)
    REFERENCES member (no);

ALTER TABLE review
  ADD CONSTRAINT FK_shop_TO_review
    FOREIGN KEY (shop_no)
    REFERENCES shop (no);

ALTER TABLE orderlist
  ADD CONSTRAINT FK_shop_TO_orderlist
    FOREIGN KEY (shop_no)
    REFERENCES shop (no);

ALTER TABLE Order_cancel
  ADD CONSTRAINT FK_orderlist_TO_Order_cancel
    FOREIGN KEY (orderlist_no)
    REFERENCES orderlist (no);

ALTER TABLE menu
  ADD CONSTRAINT FK_shop_TO_menu
    FOREIGN KEY (shop_no)
    REFERENCES shop (no);

ALTER TABLE review
  ADD CONSTRAINT FK_member_TO_review
    FOREIGN KEY (member_no)
    REFERENCES member (no);

      


insert into member (id, pw, name, tel, addr, addr2, regdate, grade, memberX, memberY)
values ('admin','admin','관리자', '010-1234-1234' ,'서울 구로구 구로동 589-7','구로역 3번 승강장','2000-01-01'
,3 ,126.881396281118,37.5029205056812);

insert into member (id, pw, name, tel, addr, addr2, regdate, grade, memberX, memberY)
values ('scott','tiger','김경영', '010-1234-1234' ,'서울 구로구 구로중앙로34길 33-4','경영 기술 개발원 401호','2000-01-01'
,1 ,126.884660819027,37.5009565732326);

select * from member;

desc member;
desc shop;
desc menu;
desc orderlist;
desc notice;
desc review;


show tables;
;

