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
