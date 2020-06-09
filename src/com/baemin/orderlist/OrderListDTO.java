package com.baemin.orderlist;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Hashtable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class OrderListDTO {
    private int no; // PK
    private int shopNo;// 주문 가게 이름
    private String name; // 주문자 이름
    private int nameNo; // 주문자 번호
    private Timestamp orderDate; // now
    private int status;
    // -1 취소
    // default 0 신규주문
    // 1 접수 . 조리중
    // 2 배달보냄
    // 3 마감
    // 영업종료 하면 0,1 >> -1 , 2 >> 3
    private String orderList; // 메뉴, 수량
    private Timestamp completeTime;
    private String whyCancel;
    private String addr;
    private String addr2;
    private String comment;

    // NOT IN DB - 삭제예정???
    private Hashtable<Integer, Integer> hashtable;
}
