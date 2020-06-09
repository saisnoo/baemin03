package com.baemin.orderlist.cart;

import lombok.*;

@Getter
@Setter
@ToString
public class CartDTO {
    private String menuName;
    private int count;
    private int menuPrice;
}