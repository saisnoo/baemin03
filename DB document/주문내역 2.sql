/* 신규 */
SELECT NO, NAME, orderDate, tel, STATUS, addr, addr2, COMMENT, shop_no, member_no, completeTime, Group_concat( aaa SEPARATOR  ' / ') menuString
FROM(

SELECT *,concat(menuName, ' X ' ,COUNT) AS aaa FROM (
  SELECT orderlist.no NO, orderlist.name NAME, DATE_FORMAT( orderlist.orderDate, '%H:%i') orderDate, orderlist.status STATUS, 
orderlist.addr addr, orderlist.addr2 addr2, orderlist.comment COMMENT, orderlist.shop_no shop_no, orderlist.member_no member_No,
 orderlist.completeTime completeTime , member.tel , 
order_menu.menu_No menu_no, order_menu.count COUNT, menu.menuName menuName, menu.menuPrice menuPrice
FROM orderlist, order_menu, menu , member
WHERE orderlist.shop_no = 1
 AND orderlist.no  = order_menu.orderlist_No
 AND order_menu.menu_No = menu.no
 AND orderlist.STATUS BETWEEN 0 AND 1
  AND member.no = orderlist.member_no
ORDER BY orderlist.orderdate ASC , orderlist.no asc
) CNT
)CNT 
GROUP BY no;


/*  배달중   */
SELECT NO, NAME, orderDate, tel, STATUS, addr, addr2, COMMENT, shop_no, member_no, completeTime, Group_concat( aaa SEPARATOR  ' / ') menuString
FROM(

SELECT *,concat(menuName, ' X ' ,COUNT) AS aaa FROM (
  SELECT orderlist.no NO, orderlist.name NAME, DATE_FORMAT( orderlist.orderDate, '%H:%i') orderDate, orderlist.status STATUS, 
orderlist.addr addr, orderlist.addr2 addr2, orderlist.comment COMMENT, orderlist.shop_no shop_no, orderlist.member_no member_No,
 orderlist.completeTime completeTime , member.tel , 
order_menu.menu_No menu_no, order_menu.count COUNT, menu.menuName menuName, menu.menuPrice menuPrice
FROM orderlist, order_menu, menu , member
WHERE orderlist.shop_no = 1
 AND orderlist.no  = order_menu.orderlist_No
 AND order_menu.menu_No = menu.no
AND orderlist.STATUS = 2 
 AND orderlist.completeTime > NOW() 
  AND member.no = orderlist.member_no
ORDER BY orderlist.orderdate ASC , orderlist.no asc
) CNT
)CNT 
GROUP BY no;



/*  완료  */
SELECT NO, NAME, orderDate, tel, STATUS, addr, addr2, COMMENT, shop_no, member_no, completeTime, Group_concat( aaa SEPARATOR  ' / ') menuString
FROM(
SELECT *,concat(menuName, ' X ' ,COUNT) AS aaa FROM (
  SELECT orderlist.no NO, orderlist.name NAME, DATE_FORMAT( orderlist.orderDate, '%H:%i') orderDate, orderlist.status STATUS, 
orderlist.addr addr, orderlist.addr2 addr2, orderlist.comment COMMENT, orderlist.shop_no shop_no, orderlist.member_no member_No,
 orderlist.completeTime completeTime , member.tel , 
order_menu.menu_No menu_no, order_menu.count COUNT, menu.menuName menuName, menu.menuPrice menuPrice
FROM orderlist, order_menu, menu , member
WHERE orderlist.shop_no = 1
 AND orderlist.no  = order_menu.orderlist_No
 AND order_menu.menu_No = menu.no
  AND orderlist.completeTime < NOW()
 AND  orderlist.orderDate BETWEEN (DATE_ADD(NOW(), INTERVAL -1 DAY)) and now()
  AND member.no = orderlist.member_no
ORDER BY orderlist.orderdate ASC , orderlist.no asc
) CNT
)CNT 
GROUP BY no;


-- 취소 목록
SELECT NO, NAME, orderDate, tel, STATUS, addr, addr2, COMMENT, shop_no,
member_no, completeTime, Group_concat( aaa SEPARATOR ' / ') menuString
FROM(
SELECT *,concat(menuName, ' X ' ,COUNT) AS aaa FROM (
SELECT orderlist.no NO, orderlist.name NAME, DATE_FORMAT(
orderlist.orderDate, '%H:%i') orderDate, orderlist.status STATUS,
orderlist.addr addr, orderlist.addr2 addr2, orderlist.comment COMMENT,
orderlist.shop_no shop_no, orderlist.member_no member_No,
orderlist.completeTime completeTime , member.tel ,
order_menu.menu_No menu_no, order_menu.count COUNT, menu.menuName menuName,
menu.menuPrice menuPrice
FROM orderlist, order_menu, menu , member
WHERE orderlist.shop_no = 1
AND orderlist.no = order_menu.orderlist_No
AND order_menu.menu_No = menu.no
AND STATUS = -1
AND orderlist.orderDate BETWEEN (DATE_ADD(NOW(), INTERVAL -24 HOUR)) and now()
AND member.no = orderlist.member_no
ORDER BY orderlist.orderdate ASC , orderlist.no asc
) CNT  )CNT GROUP BY no;