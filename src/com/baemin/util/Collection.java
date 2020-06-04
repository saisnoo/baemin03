package com.baemin.util;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

public class Collection {
    public static void main(String[] args) {

        Set<Integer> set = new HashSet<>();

        // List<Integer> list1 = new ArrayList<>();

        // list1.add(1)

        // List<Double> list2 = new LinkedList<>();

        // list.get()

        Hashtable<String, String> table1 = new Hashtable<>();

        table1.put("a", "b");
        table1.put("c", "d");
        table1.put("e", "f");

        table1.get("a");

        table1.size();

        String[] str = null;

        Set<String> set2 = table1.keySet();
        set2.toArray(str);

        List<String> list3 = new ArrayList<>();
        List<String> list4 = new ArrayList<>();

        for (int i = 0; i < str.length; i++) {
            list3.add(str[i]);
        }

        for (int i = 0; i < table1.size(); i++) {
            System.out.println(table1.get(list3.get(i)));
            list4.add(table1.get(list3.get(i)));
        }

    }
}