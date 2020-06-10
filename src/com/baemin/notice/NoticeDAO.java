package com.baemin.notice;

import javax.naming.*;
import javax.sql.*;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class NoticeDAO {

	// DB변수
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Context cont = null;
	DataSource ds = null;

	SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy.MM.dd");
	SimpleDateFormat dateFormat2 = new SimpleDateFormat("HH:mm:ss");
	SimpleDateFormat dateFormat3 = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");

	// getList_start-----------------------------------------------------------------------------
	public List<NoticeDTO> getList() throws Exception {
		// 출력객체
		List<NoticeDTO> list = new ArrayList<>();
		System.out.println("---NoticeDAO getList");
		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "select * from notice where (startDate <= now() AND now() <= endDate) ORDER BY no DESC";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 --- select 때만 표시
			if (rs != null) {
				while (rs.next()) {
					NoticeDTO dto = new NoticeDTO();
					dto.setNo(rs.getInt("no"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setStartDate(rs.getDate("startdate") + "");
					dto.setEndDate(rs.getDate("enddate") + "");
					list.add(dto);
				}
			}
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" getList() 예외  ");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return list;
	} // getList_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// writeNotice_start-----------------------------------------------------------------------------
	public int writeNotice(NoticeDTO dto) throws Exception {
		// 출력객체
		int result = -1;
		System.out.println("---NoticeDAO writeNotice");
		String startDate = dto.getStartDate().trim();
		String endDate = dto.getEndDate().trim();
		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "insert into notice(title, content, startdate, enddate)";
			sql += " values( ?, ?, '" + startDate + "', '" + endDate + "')";
			System.out.println("sql---" + sql);
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			// 5. 실행
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" writeNotice() 예외  ");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return result;
	} // writeNotice_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// viewNotice_start-----------------------------------------------------------------------------
	public NoticeDTO viewNotice(int no) throws Exception {
		NoticeDTO dto = new NoticeDTO();
		try {
			con = getConnection();

			String sql = "select * from notice where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setStartDate(rs.getDate("startdate") + "");
				dto.setEndDate(rs.getDate("enddate") + "");
			} // if end
		} catch (Exception ex) {
			ex.getStackTrace();
			System.out.println("viewNotice() 예외");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return dto;
	}// viewNotice_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// updateNotice_start-----------------------------------------------------------------------------
	public int updateNotice(NoticeDTO dto) throws Exception {
		// 출력객체
		int result = -1;
		System.out.println("---NoticeDAO updateNotice");
		String startDate = dto.getStartDate().trim();
		String endDate = dto.getEndDate().trim();
		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "update notice set title=?, content=?, startdate='" + startDate + "', enddate='" + endDate
					+ "' WHERE no = ?";
			System.out.println("sql---" + sql);
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNo());
			// 5. 실행
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" updateNotice() 예외  ");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return result;
	} // updateNotice_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// deleteNotice_start-----------------------------------------------------------------------------
	public int deleteNotice(int no) throws Exception {
		// 출력객체
		int result = -1;
		System.out.println("---NoticeDAO deleteNotice");
		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "delete from notice WHERE no = ?";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			// 5. 실행
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" deleteNotice() 예외  ");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return result;
	} // deleteNotice_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// ///////////////////////////////////////////////////////////////////////////////////////////
	// ///////////////////////////////////////////////////////////////////////////////////////////
	// ///////////////////////////////////////////////////////////////////////////////////////////

	// 기본생성자 private 처리
	private NoticeDAO() {
	}

	// 싱글톤 인스턴스
	private static NoticeDAO dao = new NoticeDAO();

	// public get인스턴스
	public static NoticeDAO getInstance() {
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
