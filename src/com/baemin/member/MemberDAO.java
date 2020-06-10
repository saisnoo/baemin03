package com.baemin.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

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

	// insertMember_start-----------------------------------------------------------------------------
	public int insertMember(MemberDTO dto) throws Exception {
		// 출력객체
		int result = -1;
		System.out.println("---MemberDAO insertMember");

		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "insert into member (id , pw , name , tel , addr , addr2 , regdate ,  memberX , memberY ) "
					+ " values ( ?, ?, ?, ?, ?, ? , now() ,? ,?  ) ";
			// "insert into board(no, title, content, writer, pw) "
			// + " values(board_seq.nextval, ?, ?, ?, sysdate)";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getAddr());
			pstmt.setString(6, dto.getAddr2());
			pstmt.setDouble(7, dto.getMemberX());
			pstmt.setDouble(8, dto.getMemberY());
			// 5. 실행
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" insertMember() 예외  ");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return result;
	} // insertMember_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// login_start-----------------------------------------------------------------------------
	public MemberDTO login(String id, String pw) throws Exception {
		// 출력객체
		MemberDTO dto = new MemberDTO();
		System.out.println("---MemberDAO login");
		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "select * from member WHERE id = ? AND pw = ?";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 --- select 때만 표시
			if (rs != null) {
				while (rs.next()) {
					// 세션에 담을 6가지
					dto.setNo(rs.getInt("no"));
					dto.setId(rs.getString("id"));
					dto.setName(rs.getString("name"));
					dto.setGrade(rs.getInt("grade"));
					dto.setMemberX(rs.getDouble("memberX"));
					dto.setMemberY(rs.getDouble("memberY"));
				}
			}
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" login() 예외  ");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return dto;
	} // login_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// idCheck_start-----------------------------------------------------------------------------
	public int idCheck(String id) throws Exception {
		// 출력객체
		int result = -1;
		System.out.println("---MemberDAO idCheck");
		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "select count(*) from member where id = ?";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 --- select 때만 표시
			if (rs != null) {
				while (rs.next()) {
					result = rs.getInt(1);
				}
			}
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" idCheck() 예외  ");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return result;
	} // idCheck_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// getDTO_start-----------------------------------------------------------------------------
	public MemberDTO getDTO(int no) throws Exception {
		// 출력객체
		MemberDTO dto = new MemberDTO();
		System.out.println("---MemberDAO getDTO");
		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "select no, id, pw, name, tel, addr, addr2, memberX, memberY, grade, DATE_FORMAT( regDate, '%y-%m-%d %H:%i' ) regdate from member where no = ?";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			// 6. 표시 --- select 때만 표시
			if (rs != null) {
				while (rs.next()) {
					dto.setGrade(rs.getInt("grade"));
					dto.setAddr(rs.getString("addr"));
					dto.setAddr2(rs.getString("addr2"));
					dto.setId(rs.getString("id"));
					dto.setName(rs.getString("name"));
					dto.setNo(rs.getInt("no"));
					dto.setPw(rs.getString("pw"));
					dto.setRegDate(rs.getString("regdate"));
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

	// changePW_start-----------------------------------------------------------------------------
	public int changePW(int no, String pw) throws Exception {
		return changePW(pw, no);
	}

	public int changePW(String pw, int no) throws Exception {
		// 출력객체
		int result = -1;
		System.out.println("---MemberDAO changePW");

		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "update member set pw = ? where no = ?";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setInt(2, no);
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
			String sql = "update member set addr = ?, addr2 = ?, memberX=?, memberY=? where no = ?";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getAddr());
			pstmt.setString(2, dto.getAddr2());
			pstmt.setDouble(3, dto.getMemberX());
			pstmt.setDouble(4, dto.getMemberY());
			pstmt.setInt(5, dto.getNo());
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
	public int changeTel(String tel, int no) throws Exception {
		return changeTel(no, tel);
	}

	public int changeTel(int no, String tel) throws Exception {
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
			pstmt.setInt(2, no);
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

	// getListAll_start-----------------------------------------------------------------------------
	public List<MemberDTO> getListAll() throws Exception {
		// 출력객체
		List<MemberDTO> list = new ArrayList<>();
		System.out.println("---MemberDAO getListAll");

		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "select no, id, pw, name, tel, addr, addr2, memberX, memberY, "
					+ " grade, DATE_FORMAT( regDate, '%y-%m-%d %H:%i' ) regdate from member " + " ORDER BY name ";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 --- select 때만 표시
			if (rs != null) {
				while (rs.next()) {
					MemberDTO dto = new MemberDTO();
					dto.setGrade(rs.getInt("grade"));
					dto.setAddr(rs.getString("addr"));
					dto.setAddr2(rs.getString("addr2"));
					dto.setId(rs.getString("id"));
					dto.setName(rs.getString("name"));
					dto.setNo(rs.getInt("no"));
					dto.setRegDate(rs.getString("regdate") + "");
					dto.setTel(rs.getString("tel"));
					System.out.println(dto.toString());
					list.add(dto);
				}
			}
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" getListAll() 예외  "+e);
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return list;
	} // getListAll_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// ///////////////////////////////////////////////////////////////////////////////////////////
	// ///////////////////////////////////////////////////////////////////////////////////////////
	// ///////////////////////////////////////////////////////////////////////////////////////////

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