package com.baemin.orderlist;

import javax.naming.*;
import javax.sql.*;

import java.sql.*;
import java.util.ArrayList;
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
        int result = -1;
        System.out.println("---OrderListDAO insertOrder");

        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "insert into orderlist(shop_NO, name, member_No, orderList, addr, addr2, comment, orderDate)"
                    + " values(?, ?, ?, now(), ?, ?, ?, ? )";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, dto.getShop_NO());
            pstmt.setString(2, dto.getName());
            pstmt.setInt(3, dto.getMember_No());
            pstmt.setString(4, dto.getOrderList());
            pstmt.setString(5, dto.getAddr());
            pstmt.setString(6, dto.getAddr2());
            pstmt.setString(7, dto.getComment());
            // 5. 실행
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" insertOrder() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return result;
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
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "insert into Order_cancel (whyCancel, orderlist_No) values ( ?, ? ) ";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, whyCancel);
            pstmt.setInt(2, no);
            // 5. 실행
            result1 = pstmt.executeUpdate();
            // 3. sql
            sql = "update orderList set status = -1 WHERE no = " + no;
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            // 5. 실행
            result2 = pstmt.executeUpdate();
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
                    + " status, orderList, completeTime, whyCancel, addr, addr2, comment "
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
                    dto.setOrderList(rs.getString("orderlist"));
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
            String sql = "";
            // TODO: 쿼리문 작성 및 daO

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
                    dto.setShop_NO(rs.getInt("shop_no"));
                    dto.setName(rs.getString("name"));
                    dto.setMember_No(rs.getInt("member_no"));
                    dto.setOrderDate(rs.getString("orderdate"));
                    dto.setStatus(rs.getInt("status"));
                    dto.setOrderList(rs.getString("orderlist"));
                    dto.setAddr(rs.getString("addr"));
                    dto.setAddr2(rs.getString("addr2"));
                    dto.setComment(rs.getString("comment"));
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
            String sql = "";
            // TODO: 쿼리문 작성 및 daO

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
                    dto.setShop_NO(rs.getInt("shop_no"));
                    dto.setName(rs.getString("name"));
                    dto.setMember_No(rs.getInt("member_no"));
                    dto.setOrderDate(rs.getString("orderdate"));
                    dto.setStatus(rs.getInt("status"));
                    dto.setOrderList(rs.getString("orderlist"));
                    dto.setCompleteTime(rs.getString("completeTime"));
                    dto.setAddr(rs.getString("addr"));
                    dto.setAddr2(rs.getString("addr2"));
                    dto.setComment(rs.getString("comment"));
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
            String sql = "";
            // TODO: 쿼리문 작성 및 daO
            // TODO: 쿼리문 작성 및 daO
            // TODO: 쿼리문 작성 및 daO

            System.out.println(sql);
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, shop_No);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                int i = 0; // 주문번호 rowNum
                int j = 0; // 같은 주문번호 내부 rowNum
                int preNo = -1; // 이전 주문번호
                while (rs.next()) {
                    int thisNo = rs.getInt("no");

                    if (preNo == -1) {
                        // preNo == -1 >> rs.next 처음
                        preNo = thisNo;
                    }

                    if (preNo == thisNo) {
                        // 같은 주문건
                    } else if (preNo != thisNo) {
                        // 주문번호 바뀌었다.
                        i++; // i++ 하고
                        j = 0; // j초기화
                        preNo = thisNo; // 이전 주문번호 갱신
                    }

                    System.out.println(" i = " + i + "\tj = " + j);

                    OrderListDTO orderListDto = new OrderListDTO();
                    List<Order_MenuDTO> order_menu_list = new ArrayList<>();
                    Order_MenuDTO order_menuDto = new Order_MenuDTO();
                    order_menu_list.add(order_menuDto);
                    orderListDto.setMenuList(order_menu_list);
                    list.add(orderListDto);
                    // orderListDto.setNo(rs.getInt("no"));
                    // orderListDto.setName(rs.getString("name"));
                    // orderListDto.setOrderDate(rs.getString("orderdate"));
                    // orderListDto.setStatus(rs.getInt("status"));
                    // orderListDto.setAddr(rs.getString("addr"));
                    // orderListDto.setAddr2(rs.getString("addr2"));
                    // orderListDto.setComment(rs.getString("comment"));
                    // orderListDto.setShop_NO(rs.getInt("shop_no"));
                    // orderListDto.setMember_No(rs.getInt("member_no"));
                    // orderListDto.setCompleteTime(rs.getString("completeTime"));
                    list.get(i).setNo(rs.getInt("no"));
                    list.get(i).setName(rs.getString("name"));
                    list.get(i).setOrderDate(rs.getString("orderdate"));
                    list.get(i).setStatus(rs.getInt("status"));
                    list.get(i).setAddr(rs.getString("addr"));
                    list.get(i).setAddr2(rs.getString("addr2"));
                    list.get(i).setComment(rs.getString("comment"));
                    list.get(i).setShop_NO(rs.getInt("shop_no"));
                    list.get(i).setMember_No(rs.getInt("member_no"));
                    list.get(i).setCompleteTime(rs.getString("completeTime"));
                    // dto2.setCount(rs.getInt("count"));
                    // dto2.setMenu_Name(rs.getString("menu_name"));
                    // dto2.setMenu_No(rs.getInt("menu_no"));
                    // dto2.setPrice(rs.getInt("price"));
                    list.get(i).getMenuList().get(j).setCount(rs.getInt("count"));
                    list.get(i).getMenuList().get(j).setMenu_Name(rs.getString("menu_name"));
                    list.get(i).getMenuList().get(j).setPrice(rs.getInt("price"));
                    list.get(i).getMenuList().get(j).setMenu_No(rs.getInt("menu_No"));
                    j++;

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
        OrderListDAO dao = OrderListDAO.getInstance();
        OrderListDTO dto = new OrderListDTO();
        int r = -1;

        dto.setAddr("주소주소");
        dto.setAddr2("상세주소");
        dto.setComment("맛없게 배달해주세요");
        dto.setMember_No(5);
        dto.setName("5번손님");
        dto.setShop_NO(1);

        List<Order_MenuDTO> list1 = new ArrayList<>();
        for (int i = 1; i < 6; i++) {
            Order_MenuDTO temp = new Order_MenuDTO();
            temp.setCount(i + 5);
            temp.setMenu_Name("메뉴" + i + "번");
            temp.setMenu_No(i);
            list1.add(temp);
        }
        dto.setMenuList(list1);

        String sql = "insert into order_Menu (orderlist_No, menu_No, count) VALUES ";
        List<Order_MenuDTO> menuList = dto.getMenuList();
        // 여러개 입력 문 만들기
        for (int i = 0; i < menuList.size(); i++) {
            Order_MenuDTO o = menuList.get(i);
            sql += " ( " + 3 + " , " + o.getMenu_No() + " , " + o.getCount() + " ) ,";
            System.out.println(sql);
        }
        sql += ",,,";
        sql = sql.replace(",,,,", "");
        System.out.println(sql);

        try {
            r = dao.testTransaction(dto);
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("r=" + r);
    }

}