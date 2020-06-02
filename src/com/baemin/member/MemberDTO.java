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
    private String regdate; // now()
    private int grade; // 일반 2사업자 3관리자
}