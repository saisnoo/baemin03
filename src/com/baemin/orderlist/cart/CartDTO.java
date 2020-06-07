package com.baemin.orderlist.cart;

import lombok.*;

@Getter
@Setter
@ToString
public class CartDTO {

    private int menuNo;
    private String menuName;
    private int menuPrice;
    private int count;

}