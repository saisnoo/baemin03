package com.baemin.member;

import lombok.*;

@Getter
@Setter
@ToString
public class MemberDTO {

    private int no; // pk
    private String id; // unique
    private String pw; // 영어 숫자
    private String name; //
    private String tel; // 000-0000-0000
    private String addr; // juso
    private String addr2; // 상세주소
    private String regDate; // now()
    private int grade; // 1일반 2사업자 3관리자
    private double memberX; // 주소 X좌표
    private double memberY; // 주소 Y좌표
}
