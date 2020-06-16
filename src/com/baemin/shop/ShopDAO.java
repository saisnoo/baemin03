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
	public ShopDTO login(String id, String pw) throws Exception {
		// 출력객체
		ShopDTO dto = new ShopDTO();
		System.out.println("---ShopDAO login");
		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "select * from shop WHERE  id = ? AND pw = ?";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 --- select 때만 표시
			if (rs != null) {
				while (rs.next()) {
					dto.setNo(rs.getInt("no"));
					dto.setId(rs.getString("id"));
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

	// idCheck_start-----------------------------------------------------------------------------
	public int idCheck(String id) throws Exception {
		// 출력객체
		int result = -1;
		System.out.println("---ShopDAO idCheck");
		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "select count(*) from shop where id = ?";
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

	// getShopInfo_start-----------------------------------------------------------------------------
	public ShopDTO getShopInfo(int no) throws Exception {
		// 출력객체
		ShopDTO dto = new ShopDTO();
		System.out.println("---ShopDAO getShopInfo");
		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = " SELECT shop.no NO, shop.shopName shopName, shop.shopCategory shopCategory ,"
					+ " shop.shopAddr shopAddr, shop.shopAddr2 shopAddr2 , shop.shopTel shopTel ,"
					+ " shop.shopStatus shopStatus ,  shop.shopEx shopEx,"
					+ " AVG(rank) rank   from    shop LEFT JOIN review    on shop.no = review.shop_no "
					+ " where shop.no = ?";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 --- select 때만 표시
			if (rs != null) {
				while (rs.next()) {
					dto.setNo(rs.getInt("no"));
					dto.setShopName(rs.getString("shopName"));
					dto.setShopCategory(rs.getString("shopCategory"));
					dto.setShopEx(rs.getString("shopEx"));
					dto.setShopAddr(rs.getString("shopAddr"));
					dto.setShopAddr2(rs.getString("shopAddr2"));
					dto.setShopTel(rs.getString("shopTel"));
					dto.setShopStatus(rs.getInt("shopStatus"));
					double temp_rank = rs.getDouble("rank");
					temp_rank = ((double) Math.round(temp_rank * 10)) / 10;
					dto.setRank(temp_rank);
				}
				System.out.println(dto.toString());
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
			String sql = "select shop.no no, shopName, shopCategory, shopAddr, shopX, shopY, avg(rank) "
					+ "    from shop LEFT JOIN review on shop.no = review.shop_no "
					+ "    WHERE (shopX  BETWEEN ? AND ?) " + "     AND (shopY  BETWEEN ? AND ?)"
					+ "     AND shopCategory  like '%" + category + "%' " + "  GROUP BY shop.no   "
					+ "   ORDER BY avg(rank) DESC      ";
			// select shop.no no, shopName, shopCategory, shopAddr, shopX,
			// shopY, avg(rank)
			// from shop LEFT JOIN review on shop.no = review.shop_no
			// WHERE (shopX BETWEEN 126.859660819027 AND 126.90966081902701)
			// AND (shopY BETWEEN 37.4759565732326 AND 37.5259565732326)
			// AND shopCategory like '%양식%'
			// GROUP BY shop.no
			// ORDER BY avg(rank) DESC
			System.out.println(sql);
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setDouble(1, x_min);
			pstmt.setDouble(2, x_max);
			pstmt.setDouble(3, y_min);
			pstmt.setDouble(4, y_max);
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
						double temp_rank = rs.getDouble("avg(rank)");
						temp_rank = Math.round(temp_rank * 10) / 10.0;
						dto.setNo(rs.getInt("no"));
						dto.setShopName(rs.getString("shopName"));
						dto.setShopCategory(rs.getString("shopCategory"));
						dto.setShopAddr(rs.getString("shopAddr"));
						dto.setShopX(shopX);
						dto.setShopY(shopY);
						dto.setRank(temp_rank);
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
					dto.setNo(rs.getInt("no"));
					list.add(dto);
				}
			}
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" getListAll() 예외  " + e);
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
			String sql = "insert into shop ( id, pw,  shopName, shopCategory, shopEx, shopAddr, shopAddr2, "
					+ " shopTel, shopX , shopY, regDate)  values( ?, ?, ?, ?, ?, ?, ?, ?,?,? ,now() )";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
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
			throw new Exception(" insertShop() 예외  " + e);
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return result;
	} // insertShop_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// changeShopInfo-----------------------------------------------------------------------------
	public int changeShopInfo(ShopDTO dto) throws Exception {
		// 출력객체
		int result = -1;
		System.out.println("---ShopDAO changePw");
		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "update shop set pw = ? , shoptel = ? where no = ?";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getShopTel());
			pstmt.setInt(3, dto.getNo());
			// 5. 실행
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" updateShop() 예외  ");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return result;
	} // changeShopInfo-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// magam_start-----------------------------------------------------------------------------
	public int magam(int no) throws Exception {
		// 출력객체
		int result = -1;
		System.out.println("---ShopDAO magam");
		try {
			// 1+2
			con = getConnection();
			// con=ds.getConnection();
			// 3. sql
			String sql = "update shop set shopStatus = 0 WHERE no = ?";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			// 5. 실행
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" magam() 예외  ");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return result;
	} // magam_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// shopOpen_start-----------------------------------------------------------------------------
	public int shopOpen(int no) throws Exception {
		// 출력객체
		int result = -1;
		System.out.println("---ShopDAO shopOpen");
		try {
			// 1+2
			con = getConnection();
			// con=ds.getConnection();
			// 3. sql
			String sql = "update shop set shopStatus = 1 WHERE no = ?";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			// 5. 실행
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" magam() 예외  ");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return result;
	} // shopOpen_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

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

		// select shop.no no, shopName, shopCategory, shopAddr, shopX, shopY,
		// avg(rank)
		// from shop LEFT JOIN review on shop.no = review.shop_no
		// WHERE (shopX BETWEEN 126.859660819027 AND 126.90966081902701)
		// AND (shopY BETWEEN 37.4759565732326 AND 37.5259565732326)
		// AND shopCategory like '%양식%'
		// GROUP BY shop.no
		// ORDER BY avg(rank) DESC

	}
}