package com.baemin.util;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.StringTokenizer;

public class OrderListParser {

    // <메뉴번호 , 수량> 테이블
    private Hashtable<Integer, Integer> hashtable;
    // result의 key값
    private List<Integer> listOfKey;

    /// DB에서 꺼낸 문자열 >> Hashtable< 메뉴번호 , 수량 > 으로 변환
    public Hashtable<Integer, Integer> stringToHashtable(String orderString) {
        orderString = endParderClear(orderString);
        hashtable = new Hashtable<>();
        orderString = orderString.replaceAll(" ", "");
        StringTokenizer token = new StringTokenizer(orderString, "|");

        int cnt = 0;
        while (token.hasMoreTokens()) {
            String temp = token.nextToken();
            int temp_int = Integer.parseInt(temp);

            System.out.println(temp_int + "\t" + hashtable.keySet().contains(temp_int));
            if (hashtable.keySet().contains(temp_int)) {
                // 이미 포함된 키값이면
                int temp2 = hashtable.get(temp_int);
                hashtable.put(temp_int, temp2 + 1);
            } else {
                hashtable.put(temp_int, 1);
            }
            cnt++;
        }
        listOfKey = new ArrayList<>();
        Object[] temp_op_list = hashtable.keySet().toArray();

        for (int i = 0; i < temp_op_list.length; i++) {
            listOfKey.add((int) temp_op_list[i]);
        }
        return hashtable;
    }

    // 장바구니의 hashtable > String으로 변환하는 메소드
    public String hashtableToString(Hashtable<Integer, Integer> hashtable) {
        Object[] temp_op_list = hashtable.keySet().toArray();

        String result_string = "";
        for (int i = 0; i < temp_op_list.length; i++) {
            int temp_key = (int) temp_op_list[i];
            for (int j = 0; j < hashtable.get(temp_key); j++) {
                result_string = result_string + (temp_key + "|");
                System.out.println(result_string);
            }
        }
        result_string = endParderClear(result_string);
        return result_string;
    }

    /// 해쉬테이블의 키값 (주문 메뉴 번호들)
    // list로 받아오는 메소드
    public List<Integer> getResult_key() {
        return listOfKey;
    }

    // 해시테이블의 i번째 값 value (주문 수량) 가져오기
    public int getValue(int i) {
        int temp_key = getResult_key().get(i);
        return hashtable.get(temp_key);
    }

    // SQL문에 쓰일 조건문 String
    public String whereCondition() {
        // select no, price from menu
        // WHERE no IN (1,3,7,9,11);
        String result = "(";
        for (int i = 0; i < listOfKey.size(); i++) {
            result += (listOfKey.get(i) + ",");
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

        Hashtable<Integer, Integer> ht = olp.hashtable;

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