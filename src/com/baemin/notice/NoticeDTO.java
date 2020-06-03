package com.baemin.notice;

import lombok.*;

@Getter
@Setter
@ToString
public class NoticeDTO {

    private int no;// PK
    private String title;
    private String content;
    private String startDate;
    private String endDate;
}

// create table notice
// (
// no int(4) primary key auto_increment,
// title varchar(60) not null,
// content text,
// startDate date,
// endDate date
// )