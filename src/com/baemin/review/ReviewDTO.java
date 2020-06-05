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
