package com.baemin.util;

import java.util.*;
import com.baemin.orderlist.Order_MenuDTO;

import lombok.Getter;

@Getter
public class Ht2List {

    public static List<Order_MenuDTO> ht2List(Hashtable<Integer, Order_MenuDTO> hashtable) {
        List<Order_MenuDTO> omlist = new ArrayList<>();

        Set<Integer> set1 = hashtable.keySet();

        Object[] a1 = set1.toArray();
        System.out.println("a1.length=" + a1.length);

        for (int i = 0; i < a1.length; i++) {
            omlist.add(hashtable.get(Integer.parseInt((a1[i] + "").trim())));
        }

        return omlist;
    }

}