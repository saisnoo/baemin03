package com.baemin.shop;

import lombok.*;

@Getter
@Setter
@ToString
public class ShopDTO {
    private int shopNo; // PK reference member.no
    private String shopName; //
    private String shopCategory; // 가게 분류
    private String shopEx;// 가게 설명
    private String shopLocal; // 가게 주소
    private String shopTel;
}

// create table shop
// (
// no int(4) primary key,
// shopName varchar(30) not null,
// shopCategory int(4) not null,
// shopEx varchar(30),
// shopLocal varchar(30) not null,
// shopTel varchar(20) not null
// )