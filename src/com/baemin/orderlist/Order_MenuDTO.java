package com.baemin.orderlist;

import lombok.*;

@Getter
@Setter
@ToString
public class Order_MenuDTO {
    private int no; // PK
    private int count; // 수량
    // FOREIGN KEY FOREIGN KEY FOREIGN KEY FOREIGN KEY FOREIGN KEY
    private int orderlist_No; // 주문번호
    private int menu_No; // 메뉴번호

    //// NOT IN DB -- NOT IN DB -- NOT IN DB --
    private String menu_Name;
}