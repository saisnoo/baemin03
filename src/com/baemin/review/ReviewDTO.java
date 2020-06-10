package com.baemin.review;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewDTO {

    private int no; // PK
    private String content; // 리뷰 내용
    private int rank; // 별점 1~5
    private String regDate; // 등록일
    private int shop_no; // 리뷰한 매장 번호
    private int member_no; // 리뷰 고객 번호
}
