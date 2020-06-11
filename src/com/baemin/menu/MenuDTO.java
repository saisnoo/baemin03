package com.baemin.menu;

import lombok.*;

@Getter
@Setter
@ToString
public class MenuDTO {

    private int no; // PK
    private String menuName; // 메뉴 이름
    private String menuCategory; // 메뉴 카데고리
    private String menuEx; // 메뉴 설명
    private int menuPrice; // 메뉴 가격
    private int menuStatus; // 메뉴상태 0 비활성화 1 활성화
    // Foreign Key Foreign Key Foreign Key Foreign Key Foreign Key
    private int shop_no; // 소속 매장번호
}
