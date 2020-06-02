package com.baemin.shopmember;

import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.text.SimpleDateFormat;

public class ShopMemberDAO {

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

    // getShopMemberDTO_start-----------------------------------------------------------------------------
    public ShopMemberDTO getShopMemberDTO(int no) throws Exception {
        // 출력객체
        ShopMemberDTO dto = new ShopMemberDTO();
        System.out.println("---MemberDAO getShopMemberDTO");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select * from member m LEFT JOIN div_shop s on (m.no = s.no) where m.no = ?";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, no);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    dto.setGrade(rs.getInt("grade"));
                    dto.setAddr(rs.getString("addr"));
                    dto.setId(rs.getString("id"));
                    dto.setName(rs.getString("name"));
                    dto.setNo(rs.getInt("no"));
                    dto.setPw(rs.getString("pw"));
                    dto.setRegdate(dateFormat3.format(rs.getDate("regdate")));
                    dto.setTel(rs.getString("tel"));
                    dto.setNo(rs.getInt("no"));
                    dto.setShopCategory(rs.getString("shopcategory"));
                    dto.setShopEx(rs.getString("shopex"));
                    dto.setShopLocal(rs.getString("shoplocal"));
                    dto.setShopName(rs.getString("shopname"));
                    dto.setShopNo(rs.getInt("shopno"));
                    System.out.println(dto.toString());
                }
            }

        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" getShopMemberDTO() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return dto;
    } // getShopMemberDTO_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////

    private ShopMemberDAO() {
    }

    private static class SingleTone {
        public static final ShopMemberDAO INSTANCE = new ShopMemberDAO();
    }

    public static ShopMemberDAO getInstance() {
        return SingleTone.INSTANCE;
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