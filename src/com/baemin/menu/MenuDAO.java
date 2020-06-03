package com.baemin.menu;

import javax.naming.*;
import javax.sql.*;

import java.sql.*;
import java.text.SimpleDateFormat;

public class MenuDAO {

    // DB변수
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Context cont = null;
    DataSource ds = null;

    SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy.MM.dd");
    SimpleDateFormat dateFormat2 = new SimpleDateFormat("HH:mm:ss");
    SimpleDateFormat dateFormat3 = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    private MenuDAO() {
    }

    private static class SingleTone {
        public static final MenuDAO INSTANCE = new MenuDAO();
    }

    public static MenuDAO getInstance() {
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