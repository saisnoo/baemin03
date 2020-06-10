package com.baemin.review;

import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.util.*;

public class ReviewDAO {

    // DB변수
    Connection con = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Context cont = null;
    DataSource ds = null;

    // getReview_start-----------------------------------------------------------------------------
    public ReviewDTO getReview(int no) throws Exception {
        // 출력객체
        ReviewDTO dto = new ReviewDTO();
        System.out.println("---ReviewDAO getReview");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select no, content, DATE_FORMAT( regdate, '%y-%m-%d %h:%i') regDate "
                    + " rank, shop_no, member_no " + " from review where no = ?";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, no);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    dto.setNo(rs.getInt("no"));
                    dto.setContent(rs.getString("content"));
                    dto.setRegDate(rs.getString("regdate"));
                    dto.setRank(rs.getInt("rank"));
                    dto.setShop_no(rs.getInt("shop_no"));
                    dto.setMember_no(rs.getInt("member_no"));
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" getReview() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return dto;
    } // getReview_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // getListByShop_start-----------------------------------------------------------------------------
    public List<ReviewDTO> getListByShop(int shop_no, int howManyData) throws Exception {
        // 출력객체
        List<ReviewDTO> list = new ArrayList<>();
        System.out.println("---ReviewDAO getListByShop");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select no, content, DATE_FORMAT( regdate, '%y-%m-%d %h:%i') regDate "
                    + " rank, shop_no, member_no from review WHERE shop_no = ?  ORDER by regDate DESC limit 0, ?";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, shop_no);
            pstmt.setInt(2, howManyData);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    ReviewDTO dto = new ReviewDTO();
                    dto.setNo(rs.getInt("no"));
                    dto.setContent(rs.getString("content"));
                    dto.setRegDate(rs.getString("regdate"));
                    dto.setRank(rs.getInt("rank"));
                    dto.setShop_no(rs.getInt("shop_no"));
                    dto.setMember_no(rs.getInt("member_no"));
                    list.add(dto);
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" getListByShop() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end

        return list;

    } // getListByShop_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // getListByRank_start-----------------------------------------------------------------------------
    public List<ReviewDTO> getListByRank(int shop_no, int howmany, int rank) throws Exception {
        // 출력객체
        List<ReviewDTO> list = new ArrayList<>();
        System.out.println("---ReviewDAO getListByRank");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select no, content, DATE_FORMAT( regdate, '%y-%m-%d %h:%i') regDate "
                    + " rank, shop_no, member_no " + " from review where shop_no = ? and reviewRank = ? "
                    + " ORDER by regDate desc limit 0, ?";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, shop_no);
            pstmt.setInt(2, rank);
            pstmt.setInt(3, howmany);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    ReviewDTO dto = new ReviewDTO();
                    dto.setNo(rs.getInt("no"));
                    dto.setContent(rs.getString("content"));
                    dto.setRegDate(rs.getString("regdate"));
                    dto.setRank(rs.getInt("rank"));
                    dto.setShop_no(rs.getInt("shop_no"));
                    dto.setMember_no(rs.getInt("member_no"));
                    list.add(dto);
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" getListByRank() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return list;
    } // getListByRank_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // getListByClient_start-----------------------------------------------------------------------------
    public List<ReviewDTO> getListByClient(int clientNo) throws Exception {
        // 출력객체
        List<ReviewDTO> list = new ArrayList<>();
        System.out.println("---ReviewDAO getListByClient");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select no, content, DATE_FORMAT( regdate, '%y-%m-%d %h:%i') regDate "
                    + " rank, shop_no, member_no " + " from review where reviewerNo=? order by reviewDate";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, clientNo);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    ReviewDTO dto = new ReviewDTO();
                    dto.setNo(rs.getInt("no"));
                    dto.setContent(rs.getString("content"));
                    dto.setRegDate(rs.getString("regdate"));
                    dto.setRank(rs.getInt("rank"));
                    dto.setShop_no(rs.getInt("shop_no"));
                    dto.setMember_no(rs.getInt("member_no"));
                    list.add(dto);
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" getListByClient() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return list;
    } // getListByClient_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // getReviewCount_start-----------------------------------------------------------------------------
    public int[] getReviewCount(int shop_no) throws Exception {
        // 출력객체
        int[] result = { 0, 0, 0, 0, 0 };
        System.out.println("---ReviewDAO getReviewCount");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select rank, count(rank) cnt from review where shop_no = ? group by rank";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, shop_no);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    // TODO: 컬럼명이 어떻게 나오지?
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" getReviewCount() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return result;
    } // getReviewCount_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    /////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////

    private ReviewDAO() {
    }

    private static ReviewDAO dao = new ReviewDAO();

    public static ReviewDAO getInstance() {
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