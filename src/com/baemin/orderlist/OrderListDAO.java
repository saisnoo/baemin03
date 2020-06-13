package com.baemin.orderlist;

import javax.naming.*;
import javax.sql.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

public class OrderListDAO {

    // DB변수
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Context cont = null;
    DataSource ds = null;
    Statement stmt = null;

    // testTransaction_start-----------------------------------------------------------------------------
    public int testTransaction(OrderListDTO dto) throws Exception {
        // 출력객체
        int result = -1;
        System.out.println("---OrderListDAO testTransaction");
        int orderList_No = -1; // 만약 최근 주문번호 못불러오면.... 외래키 설정으로 3번때 insert 또한 오류 발생

        try {
            // 1+2
            con = getConnection();
            System.out.println("커넥션 ㅇㅇ");
            // ##### 트랜잭션 시작
            con.setAutoCommit(false);
            System.out.println("오토커밋 껐다");

            // 111111111111111111111111111111111111111111
            // 3. sql
            String sql = "insert into orderlist(shop_NO, name, member_No, addr, addr2, comment, orderDate)"
                    + " values( ? , ? , ? , ? , ? , ? , now() )";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, dto.getShop_NO());
            pstmt.setString(2, dto.getName());
            pstmt.setInt(3, dto.getMember_No());
            pstmt.setString(4, dto.getAddr());
            pstmt.setString(5, dto.getAddr2());
            pstmt.setString(6, dto.getComment());
            // 5. 실행
            result = pstmt.executeUpdate();
            System.out.println("111111111111111111111111111111111111111111");

            // 222222222222222222222222222222222222222222
            // 3. sql
            sql = "select LAST_INSERT_ID()";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 결과값
            while (rs.next()) {
                orderList_No = rs.getInt(1);
                System.out.println("마지막으로 추가된 주문번호=" + orderList_No);
            }
            System.out.println("222222222222222222222222222222222222222222");

            // 333333333333333333333333333333333333333333
            // 3. sql
            sql = "insert into order_Menu (orderlist_No, menu_No, count) VALUES ";
            List<Order_MenuDTO> menuList = dto.getMenuList();
            // 여러개 입력 문 만들기
            for (int i = 0; i < menuList.size(); i++) {
                Order_MenuDTO o = menuList.get(i);
                sql += " ( " + orderList_No + " , " + o.getMenu_No() + " , " + o.getCount() + " ) ,";
                System.out.println(sql);
            }
            sql += ",,,";
            sql = sql.replace(",,,,", "");
            System.out.println(sql);
            // 4. 실행객체
            stmt = con.createStatement();
            // 5. 실행
            result = stmt.executeUpdate(sql);
            System.out.println("333333333333333333333333333333333333333333");

        } catch (Exception e) {
            con.rollback();
            System.out.println("!!!!!! 롤백!!");
            e.getStackTrace();
            throw new Exception(" testTransaction() 예외  ");
        } finally {
            // con.setAutoCommit(true);
            System.out.println("다시 오토커밋");
            close(con, pstmt, rs);
        } // finally end
        return result;
    } // testTransaction_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // insertOrder_start-----------------------------------------------------------------------------
    public int insertOrder(OrderListDTO dto) throws Exception {
        // 출력객체
        int result1 = -1;
        int result2 = -1;
        System.out.println("---OrderListDAO insertOrder");
        int orderList_No = -1; // 추가된 orderList 의 no
        try {
            // TODO: 트랜잭션 트랜잭션 트랜잭션 트랜잭션 트랜잭션 트랜잭션
            // 1+2
            con = getConnection();
            // ---------------------------------------------------------------------------------------
            // 3. sql
            System.out.println("-- 1 -- ");
            String sql = "insert into orderlist(name, orderDate, addr, addr2, comment, shop_No, member_No )"
                    + " values(?, now(), ?, ?, ?, ?, ? )";
            System.out.println(sql);
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getAddr());
            pstmt.setString(3, dto.getAddr2());
            pstmt.setString(4, dto.getComment());
            pstmt.setInt(5, dto.getShop_NO());
            pstmt.setInt(6, dto.getMember_No());
            // 5. 실행
            result1 = pstmt.executeUpdate();
            // ---------------------------------------------------------------------------------------
            // 3. sql // 4. 실행객체
            pstmt = con.prepareStatement("select LAST_INSERT_ID()");
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 결과값
            while (rs.next()) {
                orderList_No = rs.getInt(1);
            }
            System.out.println("마지막으로 추가된 주문번호=" + orderList_No);
            // ---------------------------------------------------------------------------------------
            // 3. sql
            sql = "insert into order_Menu (orderlist_No, menu_No, count) VALUES ";
            List<Order_MenuDTO> menuList = dto.getMenuList();
            // 여러개 입력 문 만들기
            for (int i = 0; i < menuList.size(); i++) {
                Order_MenuDTO o = menuList.get(i);
                sql += " ( " + orderList_No + " , " + o.getMenu_No() + " , " + o.getCount() + " ) ,";
                System.out.println(sql);
            }
            sql += ",,,";
            sql = sql.replace(",,,,", "");
            System.out.println(sql);
            // 4. 실행객체
            stmt = con.createStatement();
            // 5. 실행
            result2 = stmt.executeUpdate(sql);
            // ---------------------------------------------------------------------------------------
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" insertOrder() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return Math.min(result1, result2);
    } // insertOrder_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // updateStatusTo1_start-----------------------------------------------------------------------------
    public int updateStatusTo1(int no, int minute) throws Exception {
        // 출력객체
        int result = -1;
        System.out.println("---OrderListDAO updateStatusTo1");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "update orderlist set  status = 1 , completeTime = DATE_ADD( NOW() , Interval " + minute
                    + " minute) where no = ? ";
            System.out.println(sql);
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, no);
            // 5. 실행
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" updateStatusTo1() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return result;
    } // updateStatusTo1_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // updateStatusTo2_start-----------------------------------------------------------------------------
    public int updateStatusTo2(int no) throws Exception {
        // 출력객체
        int result = -1;
        System.out.println("---OrderListDAO updateStatusTo2");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "update orderlist set status = 2 WHERE no = ?";
            System.out.println(sql);
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, no);
            // 5. 실행
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" updateStatusTo2() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return result;
    } // updateStatusTo2_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // orderCancel-----------------------------------------------------------------------------
    public int orderCancel(String whyCancel, int no) throws Exception {
        return orderCancel(no, whyCancel);
    }

    public int orderCancel(OrderListDTO dto) throws Exception {
        return orderCancel(dto.getNo(), dto.getWhyCancel());
    }

    public int orderCancel(int no, String whyCancel) throws Exception {
        // 출력객체
        int result1 = -1;
        int result2 = -1;
        System.out.println("---OrderListDAO orderCancle");
        try {
        	System.out.println("---OrderListDAO orderCancle");
            // 1+2
            con = getConnection();
            System.out.println("---OrderListDAO orderCancle");
            // 3. sql
            String sql = "insert into Order_cancel (whyCancel, orderlist_No) values ( ?, ? ) ";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, whyCancel);
            pstmt.setInt(2, no);
            // 5. 실행
            result1 = pstmt.executeUpdate();
            System.out.println(result1);
            System.out.println(whyCancel);
            System.out.println(no);
            // 3. sql
            sql = "update orderlist set status = -1 WHERE no = " + no;
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            // 5. 실행
            result2 = pstmt.executeUpdate();
            System.out.println(result2);
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" orderCancle() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return Math.min(result1, result2);
    } // orderCancel-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // getOrder_start-----------------------------------------------------------------------------
    public OrderListDTO getOrder(int no) throws Exception {
        // 출력객체
        OrderListDTO dto = new OrderListDTO();
        System.out.println("---OrderListDAO getOrder");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select orderlist.no no, shop_No, name, member_No, DATE_FORMAT(orderDate, '%H:%i' ) orderDate, "
                    + " status,  completeTime, whyCancel, addr, addr2, comment "
                    + " from orderlist LEFT JOIN Order_Cancel ON  orderlist.no = order_cancel.orderlist_no WHERE orderlist.no = ? ";
            System.out.println(sql);
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, no);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    dto.setNo(rs.getInt("no"));
                    dto.setShop_NO(rs.getInt("shop_no"));
                    dto.setName(rs.getString("name"));
                    dto.setMember_No(rs.getInt("member_no"));
                    dto.setOrderDate(rs.getString("orderdate"));
                    dto.setStatus(rs.getInt("status"));
                    dto.setCompleteTime(rs.getString("completeTime"));
                    dto.setWhyCancel(rs.getString("whyCancel"));
                    dto.setAddr(rs.getString("addr"));
                    dto.setAddr2(rs.getString("addr2"));
                    dto.setComment(rs.getString("comment"));
                }
                System.out.println(dto.toString());
            }
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" getOrder() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return dto;
    } // getOrder_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // getLIstByMember_No_start-----------------------------------------------------------------------------
    public List<OrderListDTO> getListByMember_No(int nameNo) throws Exception {
        // 출력객체
        List<OrderListDTO> list = new ArrayList<>();
        System.out.println("---OrderListDAO getListByMember_No");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select orderlist.no no, shop_No, name, member_No, DATE_FORMAT(orderDate, '%H:%i' ) orderDate, "
                    + " status, orderList, completeTime, whyCancel, addr, addr2, comment "
                    + " from orderlist LEFT JOIN Order_Cancel ON  orderlist.no = order_cancel.orderlist_no WHERE "
                    + " member_No = ? order by status asc, orderdate desc ";
            System.out.println(sql);
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, nameNo);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    OrderListDTO dto = new OrderListDTO();
                    dto.setNo(rs.getInt("no"));
                    dto.setShop_NO(rs.getInt("shop_no"));
                    dto.setName(rs.getString("name"));
                    dto.setMember_No(rs.getInt("member_no"));
                    dto.setOrderDate(rs.getString("orderdate"));
                    dto.setStatus(rs.getInt("status"));
                    dto.setOrderList(rs.getString("orderlist"));
                    dto.setCompleteTime(rs.getString("completeTime"));
                    dto.setWhyCancel(rs.getString("whyCancel"));
                    dto.setAddr(rs.getString("addr"));
                    dto.setAddr2(rs.getString("addr2"));
                    dto.setComment(rs.getString("comment"));
                    list.add(dto);
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" getLIstByMember_No() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return list;
    } // getLIstByMember_No_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // getListOfCurrent_start-----------------------------------------------------------------------------
    public List<OrderListDTO> getListOfCurrent(int shopNo) throws Exception {
        // 출력객체
        List<OrderListDTO> list = new ArrayList<>();
        System.out.println("---OrderListDAO getListOfCurrent");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = " SELECT NO, NAME, orderDate, tel, STATUS, addr, addr2, COMMENT, shop_no,"
                    + "  member_no, completeTime, Group_concat( aaa SEPARATOR ' / ') menuString" + " FROM("
                    + " SELECT *,concat(menuName, ' X ' ,COUNT) AS aaa FROM ("
                    + "SELECT orderlist.no NO, orderlist.name NAME, DATE_FORMAT("
                    + " orderlist.orderDate, '%H:%i') orderDate, orderlist.status STATUS,"
                    + " orderlist.addr addr, orderlist.addr2 addr2, orderlist.comment COMMENT,"
                    + " orderlist.shop_no shop_no, orderlist.member_no member_No,"
                    + " orderlist.completeTime completeTime , member.tel ,"
                    + "  order_menu.menu_No menu_no, order_menu.count COUNT, menu.menuName menuName,"
                    + " menu.menuPrice menuPrice" + " FROM orderlist, order_menu, menu , member"
                    + "  WHERE orderlist.shop_no = ?" + " AND orderlist.no = order_menu.orderlist_No"
                    + " AND order_menu.menu_No = menu.no" + " AND orderlist.STATUS BETWEEN 0 AND 1"
                    + " AND member.no = orderlist.member_no" + "   ORDER BY orderlist.orderdate ASC , orderlist.no asc"
                    + "   ) CNT" + " )CNT" + " GROUP BY NO";

            // SELECT NO, NAME, orderDate, tel, STATUS, addr, addr2, COMMENT, shop_no,
            // member_no, completeTime, Group_concat( aaa SEPARATOR ' / ') menuString
            // FROM(
            // SELECT *,concat(menuName, ' X ' ,COUNT) AS aaa FROM (
            // SELECT orderlist.no NO, orderlist.name NAME, DATE_FORMAT(
            // orderlist.orderDate, '%H:%i') orderDate, orderlist.status STATUS,
            // orderlist.addr addr, orderlist.addr2 addr2, orderlist.comment COMMENT,
            // orderlist.shop_no shop_no, orderlist.member_no member_No,
            // orderlist.completeTime completeTime , member.tel ,
            // order_menu.menu_No menu_no, order_menu.count COUNT, menu.menuName menuName,
            // menu.menuPrice menuPrice
            // FROM orderlist, order_menu, menu , member
            // WHERE orderlist.shop_no = 1
            // AND orderlist.no = order_menu.orderlist_No
            // AND order_menu.menu_No = menu.no
            // AND orderlist.STATUS BETWEEN 0 AND 1
            // AND member.no = orderlist.member_no
            // ORDER BY orderlist.orderdate ASC , orderlist.no asc
            // ) CNT
            // )CNT
            // GROUP BY no;

            System.out.println(sql);
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, shopNo);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    OrderListDTO dto = new OrderListDTO();
                    dto.setNo(rs.getInt("no"));
                    dto.setName(rs.getString("name"));
                    dto.setOrderDate(rs.getString("orderdate"));
                    dto.setTel(rs.getString("tel"));
                    dto.setStatus(rs.getInt("status"));
                    dto.setAddr(rs.getString("addr"));
                    dto.setAddr2(rs.getString("addr2"));
                    dto.setComment(rs.getString("comment"));
                    dto.setShop_NO(rs.getInt("shop_no"));
                    dto.setMember_No(rs.getInt("member_no"));
                    dto.setCompleteTime(rs.getString("completeTime"));
                    dto.setMenu_String(rs.getString("menuString"));
                    list.add(dto);
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" getListOfCurrent() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return list;
    } // getListOfCurrent_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // getListOfGoing_start-----------------------------------------------------------------------------
    public List<OrderListDTO> getListOfGoing(int shopNo) throws Exception {
        // 출력객체
        List<OrderListDTO> list = new ArrayList<>();
        System.out.println("---OrderListDAO getListOfGoing");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "SELECT NO, NAME, orderDate, tel, STATUS, addr, addr2, COMMENT, shop_no, "
                    + "member_no, completeTime, Group_concat( aaa SEPARATOR ' / ') menuString " + "FROM( "
                    + "SELECT *,concat(menuName, ' X ' ,COUNT) AS aaa FROM ( "
                    + "SELECT orderlist.no NO, orderlist.name NAME, DATE_FORMAT( "
                    + "orderlist.orderDate, '%H:%i') orderDate, orderlist.status STATUS, "
                    + "orderlist.addr addr, orderlist.addr2 addr2, orderlist.comment COMMENT, "
                    + "  orderlist.shop_no shop_no, orderlist.member_no member_No, "
                    + "  orderlist.completeTime completeTime , member.tel , "
                    + " order_menu.menu_No menu_no, order_menu.count COUNT, menu.menuName menuName, "
                    + " menu.menuPrice menuPrice " + "FROM orderlist, order_menu, menu , member "
                    + " WHERE orderlist.shop_no = ? " + " AND orderlist.no = order_menu.orderlist_No "
                    + "AND order_menu.menu_No = menu.no " + "  AND orderlist.STATUS = 2 "
                    + " AND orderlist.completeTime > NOW() " + " AND member.no = orderlist.member_no "
                    + "ORDER BY orderlist.orderdate ASC , orderlist.no asc " + " ) CNT " + ")CNT " + " GROUP BY no; ";

            // SELECT NO, NAME, orderDate, tel, STATUS, addr, addr2, COMMENT, shop_no,
            // member_no, completeTime, Group_concat( aaa SEPARATOR ' / ') menuString
            // FROM(
            // SELECT *,concat(menuName, ' X ' ,COUNT) AS aaa FROM (
            // SELECT orderlist.no NO, orderlist.name NAME, DATE_FORMAT(
            // orderlist.orderDate, '%H:%i') orderDate, orderlist.status STATUS,
            // orderlist.addr addr, orderlist.addr2 addr2, orderlist.comment COMMENT,
            // orderlist.shop_no shop_no, orderlist.member_no member_No,
            // orderlist.completeTime completeTime , member.tel ,
            // order_menu.menu_No menu_no, order_menu.count COUNT, menu.menuName menuName,
            // menu.menuPrice menuPrice
            // FROM orderlist, order_menu, menu , member
            // WHERE orderlist.shop_no = 1
            // AND orderlist.no = order_menu.orderlist_No
            // AND order_menu.menu_No = menu.no
            // AND orderlist.STATUS = 2
            // AND orderlist.completeTime > NOW()
            // AND member.no = orderlist.member_no
            // ORDER BY orderlist.orderdate ASC , orderlist.no asc
            // ) CNT
            // )CNT
            // GROUP BY no;

            System.out.println(sql);
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, shopNo);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    OrderListDTO dto = new OrderListDTO();
                    dto.setNo(rs.getInt("no"));
                    dto.setName(rs.getString("name"));
                    dto.setOrderDate(rs.getString("orderdate"));
                    dto.setTel(rs.getString("tel"));
                    dto.setStatus(rs.getInt("status"));
                    dto.setAddr(rs.getString("addr"));
                    dto.setAddr2(rs.getString("addr2"));
                    dto.setComment(rs.getString("comment"));
                    dto.setShop_NO(rs.getInt("shop_no"));
                    dto.setMember_No(rs.getInt("member_no"));
                    dto.setCompleteTime(rs.getString("completeTime"));
                    dto.setMenu_String(rs.getString("menuString"));
                    list.add(dto);
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" getListOfGoing() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return list;
    } // getListOfGoing_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // getListFinishToday_start-----------------------------------------------------------------------------
    public List<OrderListDTO> getListDone(int shop_No) throws Exception {
        return getListFinishToday(shop_No);
    }

    public List<OrderListDTO> getListFinishToday(int shop_No) throws Exception {
        // 출력객체
        List<OrderListDTO> list = new ArrayList<>();

        System.out.println("---OrderListDAO getListFinishToday");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = " SELECT NO, NAME, orderDate, tel, STATUS, addr, addr2, COMMENT, shop_no,"
                    + " member_no, completeTime, Group_concat( aaa SEPARATOR ' / ') menuString " + "  FROM("
                    + " SELECT *,concat(menuName, ' X ' ,COUNT) AS aaa FROM ( "
                    + "  SELECT orderlist.no NO, orderlist.name NAME, DATE_FORMAT( "
                    + " orderlist.orderDate, '%H:%i') orderDate, orderlist.status STATUS, "
                    + " orderlist.addr addr, orderlist.addr2 addr2, orderlist.comment COMMENT, "
                    + "  orderlist.shop_no shop_no, orderlist.member_no member_No, "
                    + " orderlist.completeTime completeTime , member.tel , "
                    + " order_menu.menu_No menu_no, order_menu.count COUNT, menu.menuName menuName, "
                    + " menu.menuPrice menuPrice" + " FROM orderlist, order_menu, menu , member "
                    + "  WHERE orderlist.shop_no = ? " + " AND orderlist.no = order_menu.orderlist_No "
                    + " AND order_menu.menu_No = menu.no" + " AND orderlist.completeTime < NOW() "
                    + " AND orderlist.orderDate BETWEEN (DATE_ADD(NOW(), INTERVAL -1 DAY)) and now() "
                    + " AND member.no = orderlist.member_no" + " ORDER BY orderlist.orderdate ASC , orderlist.no asc"
                    + " ) CNT" + " )CNT" + " GROUP BY no;";

            // SELECT NO, NAME, orderDate, tel, STATUS, addr, addr2, COMMENT, shop_no,
            // member_no, completeTime, Group_concat( aaa SEPARATOR ' / ') menuString
            // FROM(
            // SELECT *,concat(menuName, ' X ' ,COUNT) AS aaa FROM (
            // SELECT orderlist.no NO, orderlist.name NAME, DATE_FORMAT(
            // orderlist.orderDate, '%H:%i') orderDate, orderlist.status STATUS,
            // orderlist.addr addr, orderlist.addr2 addr2, orderlist.comment COMMENT,
            // orderlist.shop_no shop_no, orderlist.member_no member_No,
            // orderlist.completeTime completeTime , member.tel ,
            // order_menu.menu_No menu_no, order_menu.count COUNT, menu.menuName menuName,
            // menu.menuPrice menuPrice
            // FROM orderlist, order_menu, menu , member
            // WHERE orderlist.shop_no = 1
            // AND orderlist.no = order_menu.orderlist_No
            // AND order_menu.menu_No = menu.no
            // AND orderlist.completeTime < NOW()
            // AND orderlist.orderDate BETWEEN (DATE_ADD(NOW(), INTERVAL -1 DAY)) and now()
            // AND member.no = orderlist.member_no
            // ORDER BY orderlist.orderdate ASC , orderlist.no asc
            // ) CNT
            // )CNT
            // GROUP BY no;

            System.out.println(sql);
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, shop_No);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    OrderListDTO dto = new OrderListDTO();
                    dto.setNo(rs.getInt("no"));
                    dto.setName(rs.getString("name"));
                    dto.setOrderDate(rs.getString("orderdate"));
                    dto.setTel(rs.getString("tel"));
                    dto.setStatus(rs.getInt("status"));
                    dto.setAddr(rs.getString("addr"));
                    dto.setAddr2(rs.getString("addr2"));
                    dto.setComment(rs.getString("comment"));
                    dto.setShop_NO(rs.getInt("shop_no"));
                    dto.setMember_No(rs.getInt("member_no"));
                    dto.setCompleteTime(rs.getString("completeTime"));
                    dto.setMenu_String(rs.getString("menuString"));
                    list.add(dto);
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" getListFinishToday() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return list;
    } // getListFinishToday_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // getListOfCancel_start-----------------------------------------------------------------------------
    public List<OrderListDTO> getListOfCancel(int shopNo, int INTERVAL_HOUR) throws Exception {
        // 출력객체
        List<OrderListDTO> list = new ArrayList<>();
        System.out.println("---OrderListDAO getListOfCancel");

        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = " SELECT NO, NAME, orderDate, tel, STATUS, addr, addr2, COMMENT, shop_no, "
                    + " member_no, completeTime, Group_concat( aaa SEPARATOR ' / ') menuString " + " FROM( "
                    + " SELECT *,concat(menuName, ' X ' ,COUNT) AS aaa FROM ( "
                    + " SELECT orderlist.no NO, orderlist.name NAME, DATE_FORMAT( "
                    + " orderlist.orderDate, '%H:%i') orderDate, orderlist.status STATUS, "
                    + " orderlist.addr addr, orderlist.addr2 addr2, orderlist.comment COMMENT, "
                    + " orderlist.shop_no shop_no, orderlist.member_no member_No, "
                    + " orderlist.completeTime completeTime , member.tel , "
                    + " order_menu.menu_No menu_no, order_menu.count COUNT, menu.menuName menuName, "
                    + " menu.menuPrice menuPrice " + " FROM orderlist, order_menu, menu , member "
                    + " WHERE orderlist.shop_no = ? " + " AND orderlist.no = order_menu.orderlist_No "
                    + " AND order_menu.menu_No = menu.no " + " AND STATUS = -1 "
                    + " AND orderlist.orderDate BETWEEN (DATE_ADD(NOW(), INTERVAL -24 HOUR)) and now() "
                    + " AND member.no = orderlist.member_no " + " ORDER BY orderlist.orderdate ASC , orderlist.no asc "
                    + " ) CNT  )CNT GROUP BY no; ";

            // SELECT NO, NAME, orderDate, tel, STATUS, addr, addr2, COMMENT, shop_no,
            // member_no, completeTime, Group_concat( aaa SEPARATOR ' / ') menuString
            // FROM(
            // SELECT *,concat(menuName, ' X ' ,COUNT) AS aaa FROM (
            // SELECT orderlist.no NO, orderlist.name NAME, DATE_FORMAT(
            // orderlist.orderDate, '%H:%i') orderDate, orderlist.status STATUS,
            // orderlist.addr addr, orderlist.addr2 addr2, orderlist.comment COMMENT,
            // orderlist.shop_no shop_no, orderlist.member_no member_No,
            // orderlist.completeTime completeTime , member.tel ,
            // order_menu.menu_No menu_no, order_menu.count COUNT, menu.menuName menuName,
            // menu.menuPrice menuPrice
            // FROM orderlist, order_menu, menu , member
            // WHERE orderlist.shop_no = 1
            // AND orderlist.no = order_menu.orderlist_No
            // AND order_menu.menu_No = menu.no
            // AND STATUS = -1
            // AND orderlist.orderDate BETWEEN (DATE_ADD(NOW(), INTERVAL -24 HOUR)) and
            // now()
            // AND member.no = orderlist.member_no
            // ORDER BY orderlist.orderdate ASC , orderlist.no asc
            // ) CNT )CNT GROUP BY no;
            System.out.println(sql);
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, shopNo);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    OrderListDTO dto = new OrderListDTO();
                    dto.setNo(rs.getInt("no"));
                    dto.setName(rs.getString("name"));
                    dto.setOrderDate(rs.getString("orderdate"));
                    dto.setTel(rs.getString("tel"));
                    dto.setStatus(rs.getInt("status"));
                    dto.setAddr(rs.getString("addr"));
                    dto.setAddr2(rs.getString("addr2"));
                    dto.setComment(rs.getString("comment"));
                    dto.setShop_NO(rs.getInt("shop_no"));
                    dto.setMember_No(rs.getInt("member_no"));
                    dto.setCompleteTime(rs.getString("completeTime"));
                    dto.setMenu_String(rs.getString("menuString"));
                    list.add(dto);
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" getListOfCancel() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return list;
    } // getListOfCancel_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    /////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////

    // 기본생성자 private 처리
    private OrderListDAO() {
    }

    // 싱글톤 인스턴스
    private static OrderListDAO dao = new OrderListDAO();

    // public get인스턴스
    public static OrderListDAO getInstance() {
        return dao;
    }

    // 커넥션 풀
    private Connection getConnection() throws Exception {
        cont = new InitialContext();
        ds = (DataSource) cont.lookup("java:comp/env/jdbc/mysql");
        return ds.getConnection();
    }

    // close 1
    static final void close(Connection con, PreparedStatement pstmt, ResultSet rs) throws Exception {
        close(con, pstmt);
        if (rs != null) {
            rs.close();
        }
    } // close () end

    // close 2
    static final void close(Connection con, PreparedStatement pstmt) throws Exception {
        if (con != null) {
            con.close();
        }
        if (pstmt != null) {
            pstmt.close();
        }
    } // close () end

    //////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////

    public static void main(String[] args) {

        System.out.println();
        System.out.println();

        OrderListDAO dao = OrderListDAO.getInstance();

        OrderListDTO dto = new OrderListDTO();

        List<Order_MenuDTO> list = new ArrayList<>();

        Order_MenuDTO a1 = new Order_MenuDTO();
        a1.setCount(1);
        a1.setMenu_No(28);
        Order_MenuDTO a2 = new Order_MenuDTO();
        a2.setCount(2);
        a2.setMenu_No(28);
        Order_MenuDTO a3 = new Order_MenuDTO();
        a3.setCount(3);
        a3.setMenu_No(28);

        list.add(a1);
        list.add(a2);
        list.add(a3);

        dto.setMenuList(list);

        dto.setAddr("평양시 원산구");
        dto.setAddr2("혁명기념관 401호");

        dto.setComment("날래날래 갖고오라우");
        dto.setShop_NO(7);
        dto.setMember_No(2);
        dto.setName("김경영");
        dto.setTel("123-456-789");

        System.out.println(dto.toString());

        try {
            dao.insertOrder(dto);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

}