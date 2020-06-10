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
    public int updateStatusTo1(int no) throws Exception {
        // 출력객체
        int result = -1;
        System.out.println("---OrderListDAO updateStatusTo1");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "update orderlist set status = 1 WHERE no = ?";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, no);
            // 5. 실행
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" updateStatus0to1() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return result;
    } // updateStatusTo1_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // updateCompleteTime_start-----------------------------------------------------------------------------
    public int updateCompleteTime(int no, int minute) throws Exception {
        // 출력객체
        int result = -1;
        System.out.println("---OrderListDAO updateCompleteTime");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "update orderlist set  status = 2 , completeTime = DATE_ADD( NOW() , Interval " + minute
                    + " minute) where no = ? ";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, no);
            // 5. 실행
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" updateCompleteTime() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return result;
    } // updateCompleteTime_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

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
            String sql = "select no, shop_No, name, member_no, DATE_FORMAT(orderDate, '%H:%i' ) orderDate, "
                    + " status, orderList, addr, addr2, comment "
                    + " from orderlist WHERE shop_No = ? AND (status=0 OR status=1) " + " ORDER BY orderDate ASC";
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
            String sql = "select no, shop_No, name, member_No, DATE_FORMAT(orderDate, '%H:%i' ) orderDate, "
                    + " status, orderList, completeTime, addr, addr2, comment "
                    + " from orderlist WHERE shop_NO = ? AND status = 2 AND completeTime > NOW() "
                    + " ORDER BY orderdate ASC";
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
    public List<OrderListDTO> getListDone(int shopNo) throws Exception {
        return getListFinishToday(shopNo);
    }

    public List<OrderListDTO> getListFinishToday(int shopNo) throws Exception {
        // 출력객체
        List<OrderListDTO> list = new ArrayList<>();
        System.out.println("---OrderListDAO getListFinishToday");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select no, shop_No, name, member_No, DATE_FORMAT(orderDate, '%H:%i' ) orderDate, "
                    + " status, orderList, completeTime, addr, addr2, comment "
                    + " from orderlist WHERE shop_NO = ? AND status = 2 AND completeTime < NOW() "
                    + " ORDER BY orderdate ASC";
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
    } // getListFinishToday_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // closeShop_start-----------------------------------------------------------------------------
    public int closeShop(int shopNo) throws Exception {
        // 출력객체
        int result = 0;
        System.out.println("---OrderListDAO closeShop");
        try {
            // 1+2
            con = getConnection();

            // TODO: 지금 (status = 0 OR status = 1) AND shop_No = ? 주문번호 구해서, order_cancel

            // 테이블에서 취소삭제 처리
            // 3. sql
            String sql = "update orderlist set status = -1  WHERE (status=0 OR status=1) AND shop_No = ?";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, shopNo);
            // 5. 실행
            result += pstmt.executeUpdate();

            ////////// 3. status = 2 해당하는 모든 주문 status = 3으로
            // 3. sql
            sql = "update orderlist set status = 3 WHERE status=2 AND shopNo = ?";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, shopNo);
            // 5. 실행
            result += pstmt.executeUpdate();

        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" closeShop() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return result;
    } // closeShop_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

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

}