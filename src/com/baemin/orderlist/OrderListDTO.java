package com.baemin.orderlist;

import java.util.Hashtable;
import java.util.List;

import lombok.*;

@Getter
@Setter
@ToString
public class OrderListDTO {
    private int no; // PK
    private String name; // 주문자 이름
    private String orderDate; // now
    private int status;
    // -1 취소
    // default 0 신규주문
    // 1 접수 . 조리중
    // 2 배달보냄
    // 영업종료 하면
    private String completeTime;
    private String addr;
    private String addr2;
    private String comment;
    // FOREIGN KEY
    private int shop_NO;// 주문 가게 이름
    private int member_No; // 주문자 번호

    // NOT IN DB ------------------------------
    /// JOIN
    private String whyCancel;
    /// JOIN
    private List<Order_MenuDTO> menuList; // ????

    //// 삭제 예정
    private String orderList; // 메뉴, 수량

}