package com.baemin.review;

import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;

public class ReviewDAO {

    // DB변수
    Connection con = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Context cont = null;
    DataSource ds = null;

    SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy.MM.dd");
    SimpleDateFormat dateFormat2 = new SimpleDateFormat("HH:mm:ss");
    SimpleDateFormat dateFormat3 = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");

    // getReview_start-----------------------------------------------------------------------------
    public ReviewDTO getReview(int reviewOrderNo) throws Exception {
        // 출력객체
        ReviewDTO dto = new ReviewDTO();
        System.out.println("---ReviewDAO getReview");

        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select * from review where reviewOrderNo = ?";
            // "select no, title, writer, to_char(writedate, 'yyyy.mm.dd') writedate,"
            // + " hit from board where no = ? order by no desc";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, reviewOrderNo);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    dto.setReviewNo(rs.getInt("reviewno"));
                    dto.setReviewShopNo(rs.getInt("reviewShopNo"));
                    dto.setReviewOrderNo(rs.getInt("reviewOrderNo"));
                    dto.setReviewContent(rs.getString("reviewcontent"));
                    dto.setReviewDate(dateFormat3.format(rs.getDate("reviewdate")));
                    dto.setReviewRank(rs.getInt("reviewRank"));
                    dto.setReviewerNo(rs.getInt("reviewerNo"));
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

    // getListByRank_start-----------------------------------------------------------------------------
    public List<ReviewDTO> getListByRank(int whichShopNo, int howmany, int rank) throws Exception {
        // 출력객체
        List<ReviewDTO> list = new ArrayList<>();
        System.out.println("---ReviewDAO getListByRank");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select * from review where reviewShopNo=? and reviewRank=?  order by reviewdate desc limit 0, ?";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, whichShopNo);
            pstmt.setInt(2, rank);
            pstmt.setInt(3, howmany);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    ReviewDTO dto = new ReviewDTO();
                    dto.setReviewNo(rs.getInt("reviewno"));
                    dto.setReviewShopNo(rs.getInt("reviewShopNo"));
                    dto.setReviewOrderNo(rs.getInt("reviewOrderNo"));
                    dto.setReviewContent(rs.getString("reviewcontent"));
                    dto.setReviewDate(dateFormat3.format(rs.getDate("reviewdate")));
                    dto.setReviewRank(rs.getInt("reviewRank"));
                    dto.setReviewerNo(rs.getInt("reviewerNo"));
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
            String sql = "select * from review where reviewerNo=? order by reviewDate";
            // "select no, title, writer, to_char(writedate, 'yyyy.mm.dd') writedate,"
            // + " hit from board where no = ? order by no desc";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, clientNo);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    ReviewDTO dto = new ReviewDTO();
                    dto.setReviewNo(rs.getInt("reviewno"));
                    dto.setReviewShopNo(rs.getInt("reviewShopNo"));
                    dto.setReviewOrderNo(rs.getInt("reviewOrderNo"));
                    dto.setReviewContent(rs.getString("reviewcontent"));
                    dto.setReviewDate(dateFormat3.format(rs.getDate("reviewdate")));
                    dto.setReviewRank(rs.getInt("reviewRank"));
                    dto.setReviewerNo(rs.getInt("reviewerNo"));
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