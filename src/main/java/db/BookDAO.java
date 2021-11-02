package db;

import java.awt.Image;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.catalina.connector.Response;

public class BookDAO {

	DBConnector db = new DBConnector();
	
	//전체출력
	public ArrayList<BookDTO> getAllBook(Response response) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		
		String sql = "select * from Book";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new BookDTO(
						rs.getString(1),//책아이디
						rs.getString(2),//책이름
						rs.getBlob(3),//책이미지
						rs.getString(4),//저자
						rs.getString(5),//내용
						rs.getString(6),//출판사
						rs.getDate(7),//출간년도
						rs.getInt(8),//권수
						rs.getInt(9),//책가격
						rs.getString(10),//목차
						rs.getInt(11)//누적판매량
				));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//한개만 출력
	public BookDTO getBook(String num) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from book where num=?";
		
		BookDTO dto = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BookDTO(
							rs.getString(1),//책아이디
							rs.getString(2),//책이름
							rs.getBlob(3),//책이미지
							rs.getString(4),//저자
							rs.getString(5),//내용
							rs.getString(6),//출판사
							rs.getDate(7),//출간년도
							rs.getInt(8),//권수
							rs.getInt(9),//책가격
							rs.getString(10),//목차
							rs.getInt(11)//누적판매량
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	//insert
	public void insertBook(BookDTO dto) throws FileNotFoundException {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql ="insert into book values(null,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBook_name());
			pstmt.setBlob(2, dto.getBook_image());
			pstmt.setString(3, dto.getWriter());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getPublisher());
			pstmt.setDate(6, dto.getYear());
			pstmt.setInt(7, dto.getEa());
			pstmt.setInt(8, dto.getBook_price());
			pstmt.setString(9, dto.getChapter());
			pstmt.setInt(10, dto.getAccum());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
}
