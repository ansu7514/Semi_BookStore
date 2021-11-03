package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ContentDAO {

	DBConnector db = new DBConnector();
	
	//리뷰에 대한 댓글 작성
	public void writerComment(CommentDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into COMMENT values(?,?,?,?,now())";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getRe_user_id());
			pstmt.setString(3, dto.getBook_id());
			pstmt.setString(4, dto.getContent());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//댓글 삭제
	public void deleteComment(CommentDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "delete from COMMENT where user_id=? and re_user_id=? and book_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getRe_user_id());
			pstmt.setString(3, dto.getBook_id());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//댓글 수정
	public void updateComment(CommentDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update COMMENT set content=? where user_id=? and re_user_id=? and book_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getContent());
			pstmt.setString(2, dto.getUser_id());
			pstmt.setString(3, dto.getRe_user_id());
			pstmt.setString(4, dto.getBook_id());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//댓글 출력 (리뷰 작성자를 클릭시)
	public ArrayList<CommentDTO> readComment(String re_user_id, String book_id) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();
		
		String sql = "select * from COMMENT where re_user_id=? and book_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, re_user_id);
			pstmt.setString(2, book_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CommentDTO dto = new CommentDTO();
				dto.setUser_id(rs.getString("user_id"));
				dto.setRe_user_id(rs.getString("re_user_id"));
				dto.setBook_id(rs.getString(rs.getString("book_id")));
				dto.setContent(rs.getString("content"));
				dto.setWriteday(rs.getDate("writeday"));
				
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
