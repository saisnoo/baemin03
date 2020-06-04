package com.baemin.orderlist;

import java.util.Date;
import java.util.Hashtable;

import lombok.*;

@Getter
@Setter
@ToString
public class OrderListDTO {
    private int no; // PK
    private int shopNo;// 주문 가게 이름
    private String name; // 주문자 이름
    private int nameNo; // 주문자 번호
    private Date orderDate; // now
    private int status;
    private String orderList; // 메뉴, 수량
    private Date estimatedTime;
    private Date completeTime;
    private String whyCancel;
    private String addr;
    private String addr2;

    // NOT IN DB
    private Hashtable<Integer, Integer> hashtable;

}
