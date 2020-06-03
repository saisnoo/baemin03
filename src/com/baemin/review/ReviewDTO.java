package com.baemin.review;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewDTO {

    private int reviewNo; // PK
    private int reviewShopNo; // 리뷰한 매장 번호
    private int reviewOrderNo; // 리뷰하는 주문번호
    private int reviewerNo; // 리뷰 고객 번호
    private String reviewContent; // 리뷰 내용
    private int reviewRank; // 별점 1~5
    private String reviewDate; // 등록일

}

// create table review
// (
// reviewNo int(4) primary key auto_increment,
// reviewShopNo int(4) not null,
// reviewOrderNo int(4) not null,
// reviewerNo int(4) not null,
// reviewContent text,
// reviewRank int(2) default 0,
// reviewDate datetime
// )

// 매장 + 별점에 따라
// 고객에 따라
// 매장에 따라 최신10개
