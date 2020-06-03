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
    private String regdate; // now()
    private int grade; // 일반 2사업자 3관리자
    private double memberX; // 주소 X좌표
    private double memberY; // 주소 Y좌표
}

// create table member
// (
// no int(5) primary key auto_increment,
// id varchar(20) not null unique,
// pw varchar(20) not null,
// name varchar(30) not null,
// tel varchar(20) not null,
// addr varchar(60) not null,
// addr2 varchar(60) not null,
// regDate date,
// grade int(2),
// memberX double,
// memberY double
// )