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
}