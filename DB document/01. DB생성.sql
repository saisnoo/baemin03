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
  addr    VARCHAR(90) NOT NULL,
  addr2   VARCHAR(90) NULL    ,
  regDate DATETIME    NOT NULL,
  memberX DOUBLE      NOT NULL,
  memberY DOUBLE      NOT NULL,
  grade   INT         NOT NULL DEFAULT 1,
  PRIMARY KEY (no)
);

ALTER TABLE member
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE TABLE menu
(
  no           INT          NOT NULL AUTO_INCREMENT,
  menuName     VARCHAR(30)  NOT NULL,
  menuCategory VARCHAR(30)  NOT NULL,
  menuEx       VARCHAR(200) NULL    ,
  menuPrice    INT          NOT NULL,
  menuStatus   INT          NOT NULL DEFAULT 0,
  shop_no      INT          NOT NULL,
  PRIMARY KEY (no)
);

CREATE TABLE notice
(
  no        INT         NOT NULL AUTO_INCREMENT COMMENT 'AUTO_Increment',
  title     VARCHAR(60) NOT NULL,
  content   TEXT        NOT NULL,
  startDate DATE        NOT NULL,
  endDate   DATE        NOT NULL,
  PRIMARY KEY (no)
);

CREATE TABLE Order_cancel
(
  no           INT         NOT NULL AUTO_INCREMENT,
  whyCancel    VARCHAR(60) NOT NULL,
  orderlist_no INT         NOT NULL COMMENT 'AUTO_Increment',
  PRIMARY KEY (no)
);

ALTER TABLE Order_cancel
  ADD CONSTRAINT UQ_orderlist_no UNIQUE (orderlist_no);

CREATE TABLE order_menu
(
  no           int NOT NULL AUTO_INCREMENT,
  orderlist_No INT NOT NULL COMMENT 'AUTO_Increment',
  menu_No      INT NOT NULL,
  count        INT NOT NULL,
  PRIMARY KEY (no)
);

CREATE TABLE orderlist
(
  no           INT         NOT NULL AUTO_INCREMENT COMMENT 'AUTO_Increment',
  name         varchar(30) NOT NULL,
  orderDate    DATETIME    NOT NULL,
  status       INT         NULL     DEFAULT 0,
  orderList    TEXT        NULL    ,
  completeTime DATETIME    NULL    ,
  addr         VARCHAR(90) NOT NULL,
  addr2        VARCHAR(90) NOT NULL,
  comment      varchar(90) NULL    ,
  shop_no      INT         NOT NULL,
  member_no    INT         NOT NULL,
  PRIMARY KEY (no)
);

CREATE TABLE review
(
  no        INT         NOT NULL AUTO_INCREMENT COMMENT 'AUTO_Increment',
  content   VARCHAR(60) NOT NULL,
  rank      INT         NOT NULL,
  regDate   DATETIME    NOT NULL,
  shop_no   INT         NOT NULL,
  member_no INT         NOT NULL,
  PRIMARY KEY (no)
);

CREATE TABLE shop
(
  no           INT         NOT NULL AUTO_INCREMENT,
  id           VARCHAR(20) NOT NULL,
  pw           VARCHAR(20) NOT NULL,
  shopName     VARCHAR(30) NOT NULL,
  shopCategory VARCHAR(60) NOT NULL,
  shopEx       TEXT        NULL    ,
  shopAddr     VARCHAR(90) NOT NULL,
  shopAddr2    VARCHAR(90) NULL    ,
  shopTel      VARCHAR(20) NOT NULL,
  shopX        DOUBLE      NOT NULL,
  shopY        DOUBLE      NOT NULL,
  shopStatus   INT         NOT NULL DEFAULT 0,
  regDate      DATETIME    NOT NULL,
  grade        INT         NOT NULL DEFAULT 2,
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

ALTER TABLE order_menu
  ADD CONSTRAINT FK_orderlist_TO_order_menu
    FOREIGN KEY (orderlist_No)
    REFERENCES orderlist (no);

ALTER TABLE order_menu
  ADD CONSTRAINT FK_menu_TO_order_menu
    FOREIGN KEY (menu_No)
    REFERENCES menu (no);

      







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

