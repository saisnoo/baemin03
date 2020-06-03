package com.baemin.util;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.StringTokenizer;

public class OrderListParser {

    // <메뉴번호 , 수량> 테이블
    private Hashtable<Integer, Integer> result;
    // result의 key값
    private List<Integer> result_key;

    public void stringToHashtable(String orderString) {
        orderString = endParderClear(orderString);
        result = new Hashtable<>();
        orderString = orderString.replaceAll(" ", "");
        StringTokenizer token = new StringTokenizer(orderString, "|");

        int cnt = 0;
        while (token.hasMoreTokens()) {
            String temp = token.nextToken();
            int temp_int = Integer.parseInt(temp);

            System.out.println(temp_int + "\t" + result.keySet().contains(temp_int));
            if (result.keySet().contains(temp_int)) {
                // 이미 포함된 키값이면
                int temp2 = result.get(temp_int);
                result.put(temp_int, temp2 + 1);
            } else {
                result.put(temp_int, 1);
            }
            cnt++;
        }
        result_key = new ArrayList<>();
        Object[] temp_op_list = result.keySet().toArray();

        for (int i = 0; i < temp_op_list.length; i++) {
            result_key.add((int) temp_op_list[i]);
        }
    }

    public String hashtableToString(Hashtable<Integer, Integer> hashtable) {
        Object[] temp_op_list = hashtable.keySet().toArray();

        String result = "";
        for (int i = 0; i < temp_op_list.length; i++) {
            int temp_key = (int) temp_op_list[i];
            for (int j = 0; j < hashtable.get(temp_key); j++) {
                result = result + (temp_key + "|");
                System.out.println(result);
            }
        }
        result = endParderClear(result);
        return result;
    }

    /// 키값 list로 받아오는 메소드
    public List<Integer> getResult_key() {
        return result_key;
    }

    // 키값으로 해시테이블 value 가져오는 메소드
    public int getValue(int key) {
        return result.get(key);
    }

    public String whereCondition() {
        // select no, price from menu
        // WHERE no IN (1,3,7,9,11);
        String result = "(";
        for (int i = 0; i < result_key.size(); i++) {
            result += (result_key.get(i) + ",");
            System.out.println(result);
        }
        result += ")";
        System.out.println(result);
        result = result.replace(",)", ")");
        System.out.println(result);
        return result;
    }

    private String endParderClear(String str) {
        int size = str.length();
        if (str.endsWith("|")) {
            str = str.substring(0, size - 1);
        }
        return str;
    }

    public static void main(String[] args) {

        String str = "1|2|3|1|5|6|7|1|9|6|3|7|5|1|9|6|5";
        // String str = "1|2|";

        OrderListParser olp = new OrderListParser();
        olp.stringToHashtable(str);

        Hashtable<Integer, Integer> ht = olp.result;

        for (int i = 0; i < 15; i++) {
            int temp = 0;

            try {
                temp = ht.get(i);
                System.out.println(i + " * " + temp);
            } catch (Exception e) {
            }
        }

        System.out.println("------------------------");
        System.out.println("ht.keySet().size()" + ht.keySet().size());

        Integer[] i_arr = ht.keySet().toArray(new Integer[0]);

        for (int i = 0; i < i_arr.length; i++) {

            System.out.println(i_arr[i] + "\t*\t" + ht.get(i_arr[i]));
        }

        System.out.println("------------------------");

        System.out.println(olp.hashtableToString(ht));

        System.out.println("------------------------");

        olp.whereCondition();

    }

}