package com.baemin.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

    // DB변수
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Context cont = null;
    DataSource ds = null;

    SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy.MM.dd");
    SimpleDateFormat dateFormat2 = new SimpleDateFormat("HH:mm:ss");
    SimpleDateFormat dateFormat3 = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");

    // getDTO_start-----------------------------------------------------------------------------
    public MemberDTO getDTO(int no) throws Exception {
        // 출력객체
        MemberDTO dto = new MemberDTO();
        System.out.println("---MemberDAO getDTO");

        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select * from member where no = ?";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, no);
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
                    dto.setRegDate(dateFormat3.format(rs.getDate("regdate")));
                    dto.setTel(rs.getString("tel"));
                    System.out.println(dto.toString());
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" getDTO() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return dto;
    } // getDTO_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // getMemberNo_start-----------------------------------------------------------------------------
    public int getMemberNo(String id, String pw) throws Exception {
        // 출력객체
        int result = -1;
        System.out.println("---MemberDAO getMemberNo");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select no from member where id = ? and pw = ?";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    result = rs.getInt("no");
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" getMemberNo() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return result;
    } // getMemberNo_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // changePW_start-----------------------------------------------------------------------------
    public int changePW(int memberNo, String pw) throws Exception {
        return changePW(pw, memberNo);
    }

    public int changePW(String pw, int memberNo) throws Exception {
        // 출력객체
        int result = -1;
        System.out.println("---MemberDAO changePW");

        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "update member set pw = ? where memberNo = ?";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, pw);
            pstmt.setInt(2, memberNo);
            // 5. 실행
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" changePW() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return result;
    } // changePW_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // changeAddr_start-----------------------------------------------------------------------------
    public int changeAddr(MemberDTO dto) throws Exception {
        // 출력객체
        int result = -1;
        System.out.println("---MemberDAO changeAddr");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "update member set addr=?, memberX=?, memberY=? where memberNo = ?";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, dto.getAddr());
            pstmt.setDouble(2, dto.getMemberX());
            pstmt.setDouble(3, dto.getMemberY());
            pstmt.setInt(4, dto.getNo());
            // 5. 실행
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" changeAddr() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return result;
    } // changeAddr_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    // changeTel_start-----------------------------------------------------------------------------
    public int changeTel(String tel, int memberNo) throws Exception {
        return changeTel(memberNo, tel);
    }

    public int changeTel(int memberNo, String tel) throws Exception {
        // 출력객체
        int result = -1;
        System.out.println("---MemberDAO changeTel");
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "update membet set tel = ? where memberNo = ?";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, tel);
            pstmt.setInt(2, memberNo);
            // 5. 실행
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" changeTel() 예외  ");
        } finally {
            close(con, pstmt, rs);
        } // finally end
        return result;
    } // changeTel_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

    /////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////

    // 기본생성자 private 처리
    private MemberDAO() {
    }

    // 싱글톤 인스턴스
    private static MemberDAO dao = new MemberDAO();

    // public get인스턴스
    public static MemberDAO getInstance() {
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