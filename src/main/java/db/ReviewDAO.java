package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {

	DBConnector db = new DBConnector();
	
	//리뷰작성
	public void writeReview(ReviewDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		//작성자, 책아이디, 별점, 작성일, 좋아요, 리뷰내용
		String sql = "insert into REVIEW values(?,?,?,now(),?)";
		
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
	
	//전체리뷰출력
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
	
	//리뷰삭제(해당 댓글도 삭제됨)
	public void deleteReview(ReviewDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "delete from REVIEW where user_id=? and book_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getBook_id());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			db.dbClose(pstmt, conn);
		}
	}
	
	//리뷰수정
	public void updateReview(ReviewDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update REVIEW set rating=?, content=? where re_user_id=? and book_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setDouble(1, dto.getRating());
			pstmt.setString(2,dto.getContent());
			pstmt.setString(3, dto.getUser_id());
			pstmt.setString(4, dto.getBook_id());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

}
