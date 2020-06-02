package com.baemin.shopmember;

import lombok.*;

@Getter
@Setter
@ToString
public class ShopMemberDTO {

    // ShopDTO -------------------------------------------------------
    private int shopNo; // PK reference member.no
    private String shopName; //
    private String shopCategory; // 가게 분류
    private String shopEx;// 가게 설명
    private String shopLocal; // 가게 주소
    // MemberDTO -------------------------------------------------------
    private int no; // pk
    private String id; // unique
    private String pw; // 영어 숫자
    private String name; //
    private String tel; // 000-0000-0000
    private String addr; // juso
    private String regdate; // now()
    private int grade; // 일반 2사업자 3관리자

}