package com.baemin.menu;

import lombok.*;

@Getter
@Setter
@ToString
public class MenuDTO {

    private int menuNo; // PK
    private int menuShopNo; // 소속 매장번호
    private String menuName; // 메뉴 이름
    private String menuCategory; // 메뉴 카데고리
    private String menuEx; // 메뉴 설명
    private int menuPrice; // 메뉴 가격
}

// create table menu
// (
// menuNo int(4) primary key auto_increment,
// menuShopNo int(4) not null,
// menuName varchar(30) not null,
// menuCategory varchar(30) not null,
// menuEx varchar(100),
// menuPrice int(7) not null
// )