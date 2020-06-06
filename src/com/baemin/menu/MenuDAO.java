package com.baemin.menu;

import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MenuDAO {

    // DB변수
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Context cont = null;
    DataSource ds = null;

    // insertMenu_start-----------------------------------------------------------------------------
    public int insertMenu(MenuDTO dto) throws Exception {
        // 출력객체
        int result = -1;
        System.out.println("---MenuDAO insertMenu");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "insert into menu(menoShopNo, menuName, menuCategory, menuEx, menuPrice)"
                    + "values (?, ?, ?, ?, ?)";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, dto.getMenuShopNo());
            pstmt.setString(2, dto.getMenuName());
            pstmt.setString(3, dto.getMenuCategory());
            pstmt.setString(4, dto.getMenuEx());
            pstmt.setInt(5, dto.getMenuPrice());
            // 5. 실행
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" insertMenu() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return result;
    } // insertMenu_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // updateStatus_start-----------------------------------------------------------------------------
    public int updateStatus(int menuNo, int menuStatus) throws Exception {
        // 출력객체
        int result = -1;
        System.out.println("---MenuDAO updateStatus");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "update menu set ";

            // ##INSERT
            // "insert into board(no, title, content, writer, pw) "
            // + " values(board_seq.nextval, ?, ?, ?, sysdate)";
            // ##SELECT
            // "select no, title, writer, to_char(writedate, 'yyyy.mm.dd') writedate,"
            // + " hit from board where no = ? order by no desc";
            // ##UPDATE
            // "update board set hit = hit + 1 , title = ? "
            // + " where no = ?";
            // ##DELETE
            // "delete from board where no = ?";

            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, no);
            // 5. 실행
            rs = pstmt.executeQuery();
            result = pstmt.executeUpdate();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    // BoardReplyDTO dto = new BoardReplyDTO();
                    // dto.setNo(rs.getInt("no"));
                    // dto.setContent(rs.getString("content"));
                    // vec.add(dto);
                }
            }

        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" updateStatus() 예외  ");
        } finally {
            DBInfo.close(con, pstmt, rs);
        } // finally end

        return result;

    } // updateStatus_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // getMenuByNo_start-----------------------------------------------------------------------------
    public MenuDTO getMenuByNo(int menuNo) throws Exception {
        // 출력객체
        MenuDTO dto = new MenuDTO();
        System.out.println("---MenuDAO getMenuByNo");

        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select * from menu where menuNo = ?";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, menuNo);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    dto.setMenuEx(rs.getString("menuex"));
                    dto.setMenuName(rs.getString("menuname"));
                    dto.setMenuNo(rs.getInt("menuNo"));
                    dto.setMenuPrice(rs.getInt("menuPrice"));
                    dto.setMenuShopNo(rs.getInt("menuShopNo"));
                    dto.setMenuCategory(rs.getString("menuCategory"));
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" getMenuByNo() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return dto;
    } // getMenuByNo_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // getListByShop_start-----------------------------------------------------------------------------
    public List<MenuDTO> getListByShop(int menuShopNo) throws Exception {
        // 출력객체
        List<MenuDTO> list = new ArrayList<>();
        System.out.println("---MenuDAO getListByShop");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select * from member where menuShopNo = ? order by menuName desc, menuCategory desc ";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, menuShopNo);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    MenuDTO dto = new MenuDTO();
                    dto.setMenuEx(rs.getString("menuex"));
                    dto.setMenuName(rs.getString("menuname"));
                    dto.setMenuNo(rs.getInt("menuNo"));
                    dto.setMenuPrice(rs.getInt("menuPrice"));
                    dto.setMenuShopNo(rs.getInt("menuShopNo"));
                    dto.setMenuCategory(rs.getString("menuCategory"));
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

    // getListByMenuNoList_start-----------------------------------------------------------------------------
    public List<MenuDTO> getListByMenuNoList(List<Integer> menuNoList) throws Exception {
        // 출력객체
        List<MenuDTO> list = new ArrayList<>();
        System.out.println("---MenuDAO getListByMenuNoList");
        String where = "where menuNo IN (";
        // where ~ IN 문자열 계산
        for (int i = 0; i < menuNoList.size(); i++) {
            where += (menuNoList.get(i) + ",");
        }
        where += ")";
        System.out.println(where);
        where = where.replace(",)", ")");
        System.out.println(where);
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select * from menu " + where;
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    MenuDTO dto = new MenuDTO();
                    dto.setMenuEx(rs.getString("menuex"));
                    dto.setMenuName(rs.getString("menuname"));
                    dto.setMenuNo(rs.getInt("menuNo"));
                    dto.setMenuPrice(rs.getInt("menuPrice"));
                    dto.setMenuShopNo(rs.getInt("menuShopNo"));
                    dto.setMenuCategory(rs.getString("menuCategory"));
                    list.add(dto);
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" getPriceTableByMenuNoList() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return list;
    } // getListByMenuNoList_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    /////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////

    // 기본생성자 private 처리
    private MenuDAO() {
    }

    // 싱글톤 인스턴스
    private static MenuDAO dao = new MenuDAO();

    // public get인스턴스
    public static MenuDAO getInstance() {
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