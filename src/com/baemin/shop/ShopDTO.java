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
    private String shopAddr; // 가게 주소
    private String shopAddr2; // 가게 주소
    private String shopTel;
    private double shopX;
    private double shopY;
    private int shopStatus; // 0 영업종료 1영업중

    // NOT IN TABLE
    private double reviewRank;
}
