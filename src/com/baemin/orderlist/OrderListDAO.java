package com.baemin.orderlist;

import javax.naming.*;
import javax.sql.*;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class OrderListDAO {

    // DB변수
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Context cont = null;
    DataSource ds = null;

    SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy.MM.dd");
    SimpleDateFormat dateFormat2 = new SimpleDateFormat("HH:mm:ss");
    SimpleDateFormat dateFormat3 = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");

    // insertOrder_start-----------------------------------------------------------------------------
    public int insertOrder(OrderListDTO dto) throws Exception {
        // 출력객체
        int result = -1;
        System.out.println("---OrderListDAO insertOrder");

        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "insert into orderlist(shopNo, name, nameNo, orderDate, orderList, addr, addr2, comment)"
                    + " values(?, ?, ?, now(), ?, ?, ?, ? )";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, dto.getShopNo());
            pstmt.setString(2, dto.getName());
            pstmt.setInt(3, dto.getNameNo());
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

    // updateStatusPlus1_start-----------------------------------------------------------------------------
    public int updateStatusPlus1(int no) throws Exception {
        // 출력객체
        int result = -1;
        System.out.println("---OrderListDAO updateStatusPlus1");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "update orderlist set status = status+1 WHERE no = ?";
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
    } // updateStatusPlus1_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // orderCancel-----------------------------------------------------------------------------
    public int orderCancel(String whyCancel, int no) throws Exception {
        return orderCancel(no, whyCancel);
    }

    public int orderCancel(OrderListDTO dto) throws Exception {
        return orderCancel(dto.getNo(), dto.getWhyCancel());
    }

    public int orderCancel(int no, String whyCancel) throws Exception {
        // 출력객체
        int result = -1;
        System.out.println("---OrderListDAO orderCancle");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "update orderlist set whyCancel = ? , status = -1 " + " WHERE  no = ? ";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, whyCancel);
            pstmt.setInt(2, no);
            // 5. 실행
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" orderCancle() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return result;
    } // orderCancel-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // updateCompleteTime_start-----------------------------------------------------------------------------
    public int updateCompleteTime(int no, int timeDelayFromNow) throws Exception {
        // 출력객체
        int result = -1;
        System.out.println("---OrderListDAO updateCompleteTime");

        // TODO: 현재시간 + 몇분 으로 새로운 시간 값

        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "SQL_SOMETHING";
            // ##UPDATE
            // "update board set hit = hit + 1 , title = ? "
            // + " where no = ?";

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

    // getOrder_start-----------------------------------------------------------------------------
    public OrderListDTO getOrder(int no) throws Exception {
        // 출력객체
        OrderListDTO dto = new OrderListDTO();
        System.out.println("---OrderListDAO getOrder");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select no, shopNo, name, nameNo, DATE_FORMAT(orderDate, '%H:%i' ) orderDate, "
                    + " status, orderList, completeTime, whyCancel, addr, addr2, comment "
                    + " from orderlist where no = ? ";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, no);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    dto.setNo(rs.getInt("no"));
                    dto.setShopNo(rs.getInt("shopNo"));
                    dto.setName(rs.getString("name"));
                    dto.setNameNo(rs.getInt("nameNo"));
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

    // getListByNameNO_start-----------------------------------------------------------------------------
    public List<OrderListDTO> getListByNameNO(int nameNo) throws Exception {
        // 출력객체
        List<OrderListDTO> list = new ArrayList<>();
        System.out.println("---OrderListDAO getListByNameNO");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select no, shopNo, name, nameNo, DATE_FORMAT(orderDate, '%H:%i' ) orderDate, "
                    + " status, orderList, completeTime, whyCancel, addr, addr2, comment "
                    + " from orderlist where nameno = ? order by status asc, orderdate desc ";
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
                    dto.setShopNo(rs.getInt("shopNo"));
                    dto.setName(rs.getString("name"));
                    dto.setNameNo(rs.getInt("nameNo"));
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
            throw new Exception(" getListByNameNO() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return list;
    } // getListByNameNO_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // getListOfCurrent_start-----------------------------------------------------------------------------
    public List<OrderListDTO> getListOfCurrent(int shopNo) throws Exception {
        // 출력객체
        List<OrderListDTO> list = new ArrayList<>();
        System.out.println("---OrderListDAO getListOfCurrent");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select no, shopNo, name, nameNo, DATE_FORMAT(orderDate, '%H:%i' ) orderDate, "
                    + " status, orderList, completeTime, whyCancel, addr, addr2, comment "
                    + " from orderlist WHERE ShopNo=? AND (status=0 OR status=1) " + " ORDER BY orderDate ASC";
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
                    dto.setShopNo(rs.getInt("shopNo"));
                    dto.setName(rs.getString("name"));
                    dto.setNameNo(rs.getInt("nameNo"));
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
            String sql = "select no, shopNo, name, nameNo, DATE_FORMAT(orderDate, '%H:%i' ) orderDate, "
                    + " status, orderList, completeTime, whyCancel, addr, addr2, comment "
                    + " from orderlist WHERE shopNo = ? AND status = 2 AND completeTime > NOW() "
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
                    dto.setShopNo(rs.getInt("shopNo"));
                    dto.setName(rs.getString("name"));
                    dto.setNameNo(rs.getInt("nameNo"));
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
            String sql = "select no, shopNo, name, nameNo, DATE_FORMAT(orderDate, '%H:%i' ) orderDate, "
                    + " status, orderList, completeTime, whyCancel, addr, addr2, comment "
                    + " from orderlist WHERE shopNo = ? AND status = 2 AND completetime < NOW() "
                    + " ORDER BY orderdate DESC";
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
                    dto.setShopNo(rs.getInt("shopNo"));
                    dto.setName(rs.getString("name"));
                    dto.setNameNo(rs.getInt("nameNo"));
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
            // 3. sql
            String sql = "update orderlist set status = -1, whyCancel = '영업종료' WHERE "
                    + " (status=0 OR status=1) AND shopNo = ?";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, shopNo);
            // 5. 실행
            result += pstmt.executeUpdate();
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

    // countNewOrder_start-----------------------------------------------------------------------------
    public int countNewOrder(int shopNo) throws Exception {
        // 출력객체
        int result = -1;
        System.out.println("---OrderListDAO countNewOrder");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select count(*) from orderlist where shopNo = ? AND status = 0";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, shopNo);
            // 5. 실행
            rs = pstmt.executeQuery();
            result = pstmt.executeUpdate();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    result = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" countNewOrder() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return result;
    } // countNewOrder_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // countCurrentOrder_start-----------------------------------------------------------------------------
    public int countCurrentOrder(int shopNo) throws Exception {
        // 출력객체
        int result = -1;
        System.out.println("---OrderListDAO countCurrentOrder");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select count(*) from orderlist where shopNo = ? AND status = 1";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, shopNo);
            // 5. 실행
            rs = pstmt.executeQuery();
            result = pstmt.executeUpdate();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    result = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" countNewOrder() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return result;
    } // countCurrentOrder_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // countGoingOrder_start-----------------------------------------------------------------------------
    public int countGoingOrder(int shopNo) throws Exception {
        // 출력객체
        int result = -1;
        System.out.println("---OrderListDAO countGoingOrder");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select count(*) from orderlist where shopNo = ? AND status = 2";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, shopNo);
            // 5. 실행
            rs = pstmt.executeQuery();
            result = pstmt.executeUpdate();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    result = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" countNewOrder() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return result;
    } // countGoingOrder_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // countDoneOrder_start-----------------------------------------------------------------------------
    public int countDoneOrder(int shopNo) throws Exception {
        // 출력객체
        int result = -1;
        System.out.println("---OrderListDAO countDoneOrder");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select count(*) from orderlist WHERE shopNo = 5 AND status = 2 AND completetime < NOW()";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, shopNo);
            // 5. 실행
            rs = pstmt.executeQuery();
            result = pstmt.executeUpdate();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    result = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" countNewOrder() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return result;
    } // countDoneOrder_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

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