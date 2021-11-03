package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class HeartDAO {

	DBConnector db = new DBConnector();
	
	//리뷰추천
	public void like(HeartDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into HEART values(?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getLike_user_id());
			pstmt.setString(1, dto.getRe_user_id());
			pstmt.setString(3, dto.getBook_id());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//리뷰추천 삭제
	public void deleteLike(HeartDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "delete from HEART where like_user_id=? and re_user_id=? and book_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getLike_user_id());
			pstmt.setString(2, dto.getRe_user_id());
			pstmt.setString(3, dto.getBook_id());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//리뷰추천개수
	public int getLike(HeartDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cnt=0;
		
		String sql = "select count(*) from REVIEW where re_user_id=? and book_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getRe_user_id());
			pstmt.setString(2, dto.getBook_id());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
}
