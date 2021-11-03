package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReviewDAO {

	DBConnector db = new DBConnector();
	
	//리뷰작성
	public void writeReview(ReviewDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		//작성자, 책아이디, 별점, 작성일, 좋아요, 리뷰내용
		String sql = "insert into REVIEW values(?,?,?,now(),null,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getBook_id());
			pstmt.setDouble(3, dto.getRating());			
			pstmt.setString(4, dto.getContent());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//리뷰출력
	public ArrayList<ReviewDTO> readReview(String book_id) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
		
		String sql = "select * from REVIEW where book_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				dto.setUser_id(rs.getString("user_id"));
				dto.setBook_id(rs.getString("book_id"));
				dto.setRating(rs.getDouble("rating"));
				dto.setWrtieday(rs.getDate("writeday"));
				dto.setHeart(rs.getInt("heart"));
				dto.setContent(rs.getString("content"));
				
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
