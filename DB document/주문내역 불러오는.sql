SELECT * FROM orderlist, order_menu, menu WHERE orderlist.no = order_menu.orderlist_No AND order_menu.menu_No = menu.no
AND  orderlist.no = 1;



/* 신규주문 */
SELECT orderlist.no NO, orderlist.name NAME, DATE_FORMAT( orderlist.orderDate, '%H:%i') orderDate, orderlist.status STATUS, 
orderlist.addr addr, orderlist.addr2 addr2, orderlist.comment COMMENT, orderlist.shop_no shop_no, orderlist.member_no member_No,
 orderlist.completeTime completeTime ,
order_menu.menu_No menu_no, order_menu.count COUNT, menu.menuName menuName, menu.menuPrice menuPrice
FROM orderlist, order_menu, menu 
WHERE orderlist.shop_no = 1
 AND orderlist.no  = order_menu.orderlist_No
 AND order_menu.menu_No = menu.no
 AND orderlist.STATUS BETWEEN 0 AND 1
ORDER BY orderlist.orderdate ASC , orderlist.no asc
;

/* 배달중 리스트 */
SELECT orderlist.no NO, orderlist.name NAME, DATE_FORMAT( orderlist.orderDate, '%H:%i') orderDate, orderlist.status STATUS, 
orderlist.addr addr, orderlist.addr2 addr2, orderlist.comment COMMENT, orderlist.shop_no shop_no, orderlist.member_no member_No,
 orderlist.completeTime completeTime ,
order_menu.menu_No menu_no, order_menu.count COUNT, menu.menuName menuName, menu.menuPrice menuPrice
FROM orderlist, order_menu, menu 
WHERE orderlist.shop_no = 1
 AND orderlist.no = order_menu.orderlist_No
 AND order_menu.menu_No = menu.no  
 AND orderlist.STATUS = 2 
 AND orderlist.completeTime > NOW() 
ORDER BY orderlist.orderdate ASC , orderlist.no asc
;

/* 완료리스트 */
SELECT orderlist.no NO, orderlist.name NAME, DATE_FORMAT( orderlist.orderDate, '%H:%i') orderDate, orderlist.status STATUS, 
orderlist.addr addr, orderlist.addr2 addr2, orderlist.comment COMMENT, orderlist.shop_no shop_no, orderlist.member_no member_No,
 orderlist.completeTime completeTime ,
order_menu.menu_No menu_no, order_menu.count COUNT, menu.menuName menuName, menu.menuPrice menuPrice
FROM orderlist, order_menu, menu 
WHERE orderlist.shop_no = 1
and orderlist.no = order_menu.orderlist_No
 AND order_menu.menu_No = menu.no  
 AND orderlist.completeTime < NOW()
 AND  orderlist.orderDate BETWEEN (DATE_ADD(NOW(), INTERVAL -1 DAY)) and now()
ORDER BY orderlist.orderdate ASC
;



-- 전부 join한 주문내역 기본
SELECT orderlist.no NO, orderlist.name NAME, DATE_FORMAT( orderlist.orderDate, '%H:%i') orderDate, orderlist.status STATUS, 
orderlist.addr addr, orderlist.addr2 addr2, orderlist.comment COMMENT, orderlist.shop_no shop_no, orderlist.member_no member_No,
order_menu.menu_No menu_no, order_menu.count COUNT, menu.menuName menuName, menu.menuPrice menuPrice, orderlist.completeTime completeTime  
FROM orderlist, order_menu, menu
WHERE orderlist.no = order_menu.orderlist_no
AND  order_menu.menu_No = menu.no
ORDER BY orderlist.orderdate ASC;


-- 주문내역 of 특정 인물
SELECT orderlist.no NO, orderlist.name NAME, DATE_FORMAT( orderlist.orderDate, '%H:%i') orderDate, orderlist.status STATUS, 
orderlist.addr addr, orderlist.addr2 addr2, orderlist.comment COMMENT, orderlist.shop_no shop_no, orderlist.member_no member_No,
order_menu.menu_No menu_no, order_menu.count COUNT, menu.menuName menuName, menu.menuPrice menuPrice, orderlist.completeTime completeTime  
FROM orderlist, order_menu, menu
WHERE orderlist.member_no = 3
and orderlist.no = order_menu.orderlist_no
AND  order_menu.menu_No = menu.no
ORDER BY orderlist.orderdate ASC
;



-- 취소사유 left join 한 주문내역
SELECT NO_pk, NAME, orderdate, STATUS, addr, addr2, COMMENT, shop_no, member_no, menu_no, COUNT, menuName, menuPrice, completeTime, 
order_cancel.whyCancel
FROM 
(

SELECT orderlist.no NO_pk, orderlist.name NAME, DATE_FORMAT( orderlist.orderDate, '%H:%i') orderDate, orderlist.status STATUS, 
orderlist.addr addr, orderlist.addr2 addr2, orderlist.comment COMMENT, orderlist.shop_no shop_no, orderlist.member_no member_No,
order_menu.menu_No menu_no, order_menu.count COUNT, menu.menuName menuName, menu.menuPrice menuPrice, orderlist.completeTime completeTime  
FROM orderlist, order_menu, menu
WHERE orderlist.no = order_menu.orderlist_no
AND  order_menu.menu_No = menu.no
ORDER BY orderlist.orderdate ASC


) CNT
LEFT JOIN order_cancel
on NO_pk = order_cancel.orderlist_no
;



-- 취소사유 left join 한 주문내역
SELECT NO_pk, NAME, orderdate, STATUS, addr, addr2, COMMENT, shop_no, member_no, menu_no, COUNT, menuName, menuPrice, completeTime, 
order_cancel.whyCancel
FROM 
(
SELECT orderlist.no NO_pk, orderlist.name NAME, DATE_FORMAT( orderlist.orderDate, '%H:%i') orderDate, orderlist.status STATUS, 
orderlist.addr addr, orderlist.addr2 addr2, orderlist.comment COMMENT, orderlist.shop_no shop_no, orderlist.member_no member_No,
order_menu.menu_No menu_no, order_menu.count COUNT, menu.menuName menuName, menu.menuPrice menuPrice, orderlist.completeTime completeTime  
FROM orderlist, order_menu, menu
WHERE orderlist.member_no = 3
and orderlist.no = order_menu.orderlist_no
AND  order_menu.menu_No = menu.no
ORDER BY orderlist.orderdate ASC
) CNT
LEFT JOIN order_cancel
on NO_pk = order_cancel.orderlist_no
;
