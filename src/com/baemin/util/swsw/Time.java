package com.baemin.util.swsw;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Time {

    public static void main(String[] args) {

        Date d1 = new Date();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
        SimpleDateFormat sdf3 = new SimpleDateFormat("HH:mm:ss");
        SimpleDateFormat sdf4 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        System.out.println(d1);
        System.out.println(sdf1.format(d1));
        System.out.println(sdf2.format(d1));
        System.out.println(sdf3.format(d1));
        System.out.println(sdf4.format(d1));

        Timestamp tsp = new Timestamp(new Date().getTime());

    }
}