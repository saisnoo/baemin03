package com.baemin.orderlist;

import java.util.Date;
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
    private String orderList;
    private Date estimatedTime;
    private Date completeTime;
    private String whyCancel;
}

// create table orderlist (
// no int(4) primary key auto_increment,
// shopNo int(4),
// name varchar(20),
// nameNo int(4),
// orderDate datetime,
// status int(4) default 0,
// orderList varchar(60) ,
// estimatedTime datetime
// completeTime datetime.
// whyCancel text
// );
