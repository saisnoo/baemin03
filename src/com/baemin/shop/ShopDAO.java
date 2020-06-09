package com.baemin.shop;

import javax.naming.*;
import javax.sql.*;

import com.baemin.util.CoordDistance;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ShopDAO {

	// DB변수
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Context cont = null;
	DataSource ds = null;

	// login_start-----------------------------------------------------------------------------
	public ShopDTO login(String shopID, String shopPW) throws Exception {
		// 출력객체
		ShopDTO dto = new ShopDTO();
		System.out.println("---ShopDAO login");
		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "select * from shop WHERE  shopID = ? AND shopPW = ?";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, shopID);
			pstmt.setString(2, shopPW);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 --- select 때만 표시
			if (rs != null) {
				while (rs.next()) {
					dto.setShopNo(rs.getInt("shopNo"));
					dto.setShopID(rs.getString("shopID"));
					dto.setShopName(rs.getString("shopName"));
					dto.setShopCategory(rs.getString("shopCategory"));
					dto.setShopEx(rs.getString("shopEx"));
					dto.setShopAddr(rs.getString("shopAddr"));
					dto.setShopAddr2(rs.getString("shopAddr2"));
					dto.setShopTel(rs.getString("shopTel"));
					dto.setShopStatus(rs.getInt("shopStatus"));
					dto.setShopX(rs.getDouble("shopX"));
					dto.setShopY(rs.getDouble("shopY"));
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

	// getNoByID_start-----------------------------------------------------------------------------
	public int getNoByID(String shopID) throws Exception {
		// 출력객체
		int result = -1;
		System.out.println("---ShopDAO getNoByID");
		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "select count(*) from shop where shopID = ?";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, shopID);
			// 5. 실행
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" getNoByID() 예외  ");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return result;
	} // getNoByID_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// getShopInfo_start-----------------------------------------------------------------------------
	public ShopDTO getShopInfo(int shopNo) throws Exception {
		// 출력객체
		ShopDTO dto = new ShopDTO();
		System.out.println("---ShopDAO getShopInfo");
		try {
			con=getConnection();
			// 1+2
			// con=ds.getConnection();
			// 3. sql
			String sql = "select * from shop where shopNo = ?";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, shopNo);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 --- select 때만 표시
			if (rs != null) {
				while (rs.next()) {
					dto.setShopNo(rs.getInt("shopNo"));
					dto.setShopID(rs.getString("shopID"));
					dto.setShopPW(rs.getString("shopPW"));
					dto.setShopName(rs.getString("shopName"));
					dto.setShopCategory(rs.getString("shopCategory"));
					dto.setShopEx(rs.getString("shopEx"));
					dto.setShopAddr(rs.getString("shopAddr"));
					dto.setShopAddr2(rs.getString("shopAddr2"));
					dto.setShopTel(rs.getString("shopTel"));
					dto.setShopStatus(rs.getInt("shopStatus"));
					dto.setShopX(rs.getDouble("shopX"));
					dto.setShopY(rs.getDouble("shopY"));
				}
			}
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" getShopInfo() 예외  ");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return dto;
	} // getShopInfo_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-


	// getListByCategory_start-----------------------------------------------------------------------------
	public List<ShopDTO> getListByCategory(String category, double memberX, double memberY) throws Exception {
		// 출력객체
		List<ShopDTO> list = new ArrayList<>();
		System.out.println("---ShopDAO getListByCategory");

		category = category.trim();
		double x_min = memberX - CoordDistance.CoordLimit;
		double x_max = memberX + CoordDistance.CoordLimit;
		double y_min = memberY - CoordDistance.CoordLimit;
		double y_max = memberY + CoordDistance.CoordLimit;

		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String a1 = "shopNo, shopName, shopCategory, shopAddr, shopX, shopY, reviewRank ";
			String a2 = "shopNo, shopName, shopCategory, shopAddr, shopX, shopY, avg(reviewRank) reviewRank ";
			String a3 = "WHERE (shopX BETWEEN " + x_min + " AND " + x_max + ") AND (shopY BETWEEN " + y_min + " AND "
					+ y_max + ")";
			String sql = "(select " + a1 + " from shop LEFT JOIN review on shop.shopNo = reviewShopNo " + a3 + ") CNT";
			sql = "select " + a2 + " from " + sql + " where shopCategory  like '%" + category
					+ "%'  GROUP BY shopNo ORDER BY reviewRank DESC ";

			// select shopNo, shopName, shopCategory, shopAddr, shopX, shopY,
			// avg(reviewRank) reviewRank
			// from (select shopNo, shopName, shopCategory, shopAddr, shopX, shopY,
			// reviewRank from shop
			// LEFT JOIN review on shop.shopNo = reviewShopNo WHERE
			// (shopX BETWEEN 126.859660819027 AND 126.90966081902701) AND
			// (shopY BETWEEN 37.4759565732326 AND 37.5259565732326)) CNT where shopCategory
			// like '%양식%' GROUP BY shopNo ORDER BY reviewRank DESC

			System.out.println(sql);
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 --- select 때만 표시
			if (rs != null) {
				while (rs.next()) {
					ShopDTO dto = new ShopDTO();
					// 좌표 먼저 겟
					double shopX = rs.getDouble("shopX");
					double shopY = rs.getDouble("shopY");
					double distance = CoordDistance.getDistance(shopX, shopY, memberX, memberY);
					// 거리 계산해서, BaeDalLimit 보다 작을때만 리스트 add
					if (distance < CoordDistance.BaeDalLimit) {
						double temp_rank = rs.getDouble("reviewRank");
						temp_rank = Math.round(temp_rank * 10) / 10.0;

						dto.setShopNo(rs.getInt("shopNo"));
						dto.setShopName(rs.getString("shopName"));
						dto.setShopCategory(rs.getString("shopCategory"));
						dto.setShopAddr(rs.getString("shopAddr"));
						dto.setReviewRank(temp_rank);
						dto.setShopX(shopX);
						dto.setShopY(shopY);
						list.add(dto);
					}
				}
			}
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" getListByCategory() 예외  ");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return list;
	} // getListByCategory_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// getListAll_start-----------------------------------------------------------------------------
	public List<ShopDTO> getListAll() throws Exception {
		// 출력객체
		List<ShopDTO> list = new ArrayList<>();
		System.out.println("---ShopDAO getListAll");
		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "select * from shop order by shopName";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 --- select 때만 표시
			if (rs != null) {
				while (rs.next()) {
					ShopDTO dto = new ShopDTO();
					dto.setShopAddr(rs.getString("shopAddr"));
					dto.setShopAddr2(rs.getString("shopAddr2"));
					dto.setShopCategory(rs.getString("shopCategory"));
					dto.setShopName(rs.getString("shopName"));
					dto.setShopNo(rs.getInt("shopNo"));
					list.add(dto);
				}
			}
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" getListAll() 예외  ");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return list;
	} // getListAll_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// insertShop_start-----------------------------------------------------------------------------
	public int insertShop(ShopDTO dto) throws Exception {
		// 출력객체
		int result = -1;
		System.out.println("---ShopDAO insertShop");
		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "insert into board( shopID, shopPW,  shopName, shopCategory, shopEx, shopAddr, shopAddr2, shopTel, shopX , shopY) "
					+ "values( ?, ?, ?, ?, ?, ?, ?, ? )";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getShopID());
			pstmt.setString(2, dto.getShopPW());
			pstmt.setString(3, dto.getShopName());
			pstmt.setString(4, dto.getShopCategory());
			pstmt.setString(5, dto.getShopEx());
			pstmt.setString(6, dto.getShopAddr());
			pstmt.setString(7, dto.getShopAddr2());
			pstmt.setString(8, dto.getShopTel());
			pstmt.setDouble(9, dto.getShopX());
			pstmt.setDouble(10, dto.getShopY());
			// 5. 실행
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" joinShop() 예외  ");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return result;
	} // insertShop_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// updateShop_start-----------------------------------------------------------------------------
	public int updateShop(ShopDTO dto) throws Exception {
		// 출력객체
		int result = -1;
		System.out.println("---ShopDAO updateShop");
		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "update shop set shopEx = ? , shopTel = ? where shopNo = ?";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getShopEx());
			pstmt.setString(2, dto.getShopTel());
			pstmt.setInt(3, dto.getShopNo());
			// 5. 실행
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" updateShop() 예외  ");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return result;
	} // updateShop_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// ///////////////////////////////////////////////////////////////////////////////////////////
	// ///////////////////////////////////////////////////////////////////////////////////////////
	// ///////////////////////////////////////////////////////////////////////////////////////////

	// 기본생성자 private 처리
	private ShopDAO() {
	}

	// 싱글톤 인스턴스
	private static ShopDAO dao = new ShopDAO();

	// public get인스턴스
	public static ShopDAO getInstance() {
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

	public static void main(String[] args) {

		String category = "양식";

		double memberX = 126.884660819027;
		double memberY = 37.5009565732326;
		double x_min = memberX - CoordDistance.CoordLimit;
		double x_max = memberX + CoordDistance.CoordLimit;
		double y_min = memberY - CoordDistance.CoordLimit;
		double y_max = memberY + CoordDistance.CoordLimit;

		String a1 = "shopNo, shopName, shopCategory, shopAddr, shopX, shopY, reviewRank ";
		String a2 = "shopNo, shopName, shopCategory, shopAddr, shopX, shopY, avg(reviewRank) reviewRank ";
		String a3 = "WHERE (shopX BETWEEN " + x_min + " AND " + x_max + ") AND (shopY BETWEEN " + y_min + " AND "
				+ y_max + ")";
		String sql = "(select " + a1 + " from shop LEFT JOIN review on shop.shopNo = reviewShopNo " + a3 + ") CNT";
		sql = "select " + a2 + " from " + sql + " where shopCategory  like '%" + category
				+ "%'  GROUP BY shopNo ORDER BY reviewRank DESC ";

		System.out.println();
		System.out.println(sql);
		System.out.println();

	}
}