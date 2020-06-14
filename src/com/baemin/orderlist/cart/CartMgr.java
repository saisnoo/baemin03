package com.baemin.orderlist.cart;

import java.util.Hashtable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import com.baemin.orderlist.Order_MenuDTO;

@Getter
@Setter
@ToString
public class CartMgr {

    private Hashtable<Integer, Order_MenuDTO> cartTable = new Hashtable<>();

    // 장바구니에 넣기 , cartTable 넣기
    public void addCart(Order_MenuDTO dto) {
        int menu_no = dto.getMenu_No();
        int count = dto.getCount();// 주문 수량
        if (count > 0) {// 수량이 있을때만 작업 ,
            if (cartTable.containsKey(menu_no)) {// 추가 주문
                Order_MenuDTO tempDto = cartTable.get(menu_no);
                count += tempDto.getCount();// 수량추가
                tempDto.setCount(count);// 수량 setter 작업
                cartTable.put(menu_no, tempDto);// 해쉬테이블(장바구니)에 넣는다
                // .............key ... value
            } else {
                // 이 상품을 처음 사는 경우
                cartTable.put(menu_no, dto);
                // .............key ... value
            } // else end
        } // if

    }// addCart() end

    // 장바구에 있는 물건들 리스트 , cartTable 리턴
    public Hashtable<Integer, Order_MenuDTO> getCartList() {
        return cartTable;// 장바구니
    }// getCartList() end

    // cartTable 내용 수정
    public void updateCart(Order_MenuDTO dto) {
        int menu_no = dto.getMenu_No();
        cartTable.put(menu_no, dto);// key,value
    }// updateCart() end

    // cartTable 제거(장바구니에서 제거)
    public void deleteCart(Order_MenuDTO dto) {
        int menu_no = dto.getMenu_No();
        cartTable.remove(menu_no);
    }

}