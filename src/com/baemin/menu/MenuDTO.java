package com.baemin.menu;

import lombok.*;

@Getter
@Setter
@ToString
public class MenuDTO {

    private int menuNo; // PK
    private String menuName;
    private String menuEx; // 메뉴 설명
    private int menuPc; // 메뉴 가격
}