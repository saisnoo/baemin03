SELECT orderlist.no 주문번호 , menu.no  메뉴번호 , shop.no 가게번호
FROM menu, shop, orderlist
 WHERE shop.no = orderlist.shop_no AND menu.shop_no = shop.no
 ORDER BY orderlist.no
  ;
