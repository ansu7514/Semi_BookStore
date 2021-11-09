package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CartDAO {

	DBConnector db = new DBConnector();
	
	//장바구니 추가
	public void insertCart(CartDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		//사용자, 책번호, 권수
		String sql = "insert into CART values(?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getBook_id());
			pstmt.setInt(3, dto.getEa());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//장바구니 삭제
	public void deleteCart(CartDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "delete from CART where user_id=? and book_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getBook_id());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
			
		}
	}
	
	//장바구니 조회
	public ArrayList<CartDTO> selectCart(String user_id){
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CartDTO> list = new ArrayList<CartDTO>();
		
		String sql = "select b.book_name book_name, b.book_price book_price, c.user_id user_id, c.book_id book_id, c.ea ea from BOOK b, CART c where b.book_id = c.book_id and user_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CartDTO dto = new CartDTO();
				dto.setUser_id(rs.getString("user_id"));
				dto.setBook_id(rs.getString("book_id"));
				dto.setEa(rs.getInt("ea"));
				dto.setBook_name(rs.getString("book_name"));
				dto.setBook_price(rs.getInt("book_price"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
}
