package com.baemin.shop;

import lombok.*;

@Getter
@Setter
@ToString
public class ShopDTO {
    private int no; // PK reference member.no
    private String id;
    private String pw;
    private String shopName; //
    private String shopCategory; // 가게 분류
    private String shopEx;// 가게 설명
    private String shopAddr; // 가게 주소
    private String shopAddr2; // 가게 주소
    private String shopTel;
    private double shopX;
    private double shopY;
    private int shopStatus; // 0 영업종료 1영업중
    private String regDate;
    private int grade;

    // NOT IN TABLE
    private double rank; // 평균 별점 담는 객체
}
