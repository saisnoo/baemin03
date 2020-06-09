package com.baemin.orderlist.cart;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class Order2Cart {

    // DB 입력 형식
    // 김치|1|2000|된장|3|4500|감자|15|2000|.....

    // 상세주문내역 출력용
    // List<CartDTO> parseList(String orderList)

    // 총 매출액
    // int totalMoney(String orderList)

    // 리스트 출력용
    // String toMsg(String orderList)
    //
    //

    /// DB저장된 orderList >>> List<CartDTO>
    public static List<CartDTO> parseList(String orderList) {
        System.out.println("parseList()" + orderList);
        StringTokenizer st = new StringTokenizer(orderList, "|");
        int count = st.countTokens();
        System.out.println("count=" + count);
        if (count == 0 || count % 3 != 0) {
            System.out.println("문자열이 잘못되었습니다.");
            return null;
        }

        List<CartDTO> list2 = new ArrayList<>();

        while (st.hasMoreTokens()) {
            CartDTO dto = new CartDTO();
            dto.setMenuName(st.nextToken().trim());
            dto.setCount(Integer.parseInt(st.nextToken().trim()));
            dto.setMenuPrice(Integer.parseInt(st.nextToken().trim()));
            list2.add(dto);
        }
        System.out.println("list2.size()=" + list2.size());
        return list2;
    }

    //// String orderList >>> int totalMoney
    public static int totalMoney(String orderList) {
        List<Integer> intlist = new ArrayList<>();
        StringTokenizer st = new StringTokenizer(orderList, "|");
        while (st.hasMoreTokens()) {
            String temp = st.nextToken().trim();
            System.out.println("temp=" + temp);
            try {
                int temp_i = Integer.parseInt(temp);
                System.out.println(temp_i);
                intlist.add(temp_i);
                System.out.println("parseInt + add OK");
            } catch (Exception e) {
                System.out.println("nono");
            }
        }
        int result = 0;
        for (int i = 0; i < intlist.size(); i += 2) {
            System.out.println(i);
            int temp = intlist.get(i) * intlist.get(i + 1);
            result = result + temp;
            System.out.println(result);
        }
        return result;
    }

    // String orderList >> 주문내역 출력용 문자열로
    public static String toMsg(String orderList) {
        List<CartDTO> list = Order2Cart.parseList(orderList);
        String result = "";

        for (int i = 0; i < list.size(); i++) {
            String temp = list.get(i).getMenuName() + " X " + list.get(i).getCount() + " / ";
            result = result + temp;
            System.out.println(result);
        }
        result = result + "/-/-/-";
        result = result.replaceAll("/ /-/-/-", "");

        return result;
    }

    public static void main(String[] args) {

        String a1 = "김치|1|2000|된장|3|500|감자|1|200|";

        List<CartDTO> list1 = Order2Cart.parseList(a1);

        for (int i = 0; i < list1.size(); i++) {
            System.out.println(list1.get(i).toString());
        }

        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println(Order2Cart.totalMoney(a1));
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println(Order2Cart.toMsg(a1));

        // <%=order2cart.totalmoney(dto.getOrderList())%>

    }

}