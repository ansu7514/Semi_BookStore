package db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookDAO {

	DBConnector db = new DBConnector();
	
	//전체출력
	public ArrayList<BookDTO> getAllBook() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		
		String sql = "select * from BOOK";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {				
				BookDTO dto = new BookDTO();
				dto.setBook_id(rs.getString("book_id"));//책아이디
				dto.setBook_name(rs.getString("book_name"));//책이름
				dto.setBook_image(rs.getString("book_image"));//책이미지
				dto.setWriter(rs.getString("writer"));//저자
				dto.setContent(rs.getString("content"));//내용
				dto.setPublisher(rs.getString("publisher"));//출판사
				dto.setYear(Date.valueOf(rs.getString("year")));//출간년도
				dto.setEa(rs.getInt("ea"));//권수
				dto.setBookPrice(rs.getInt("book_price"));//책가격
				dto.setChapter(rs.getString("chapter"));//목차
				dto.setAccum(rs.getInt("accum"));//누적판매량
				
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
	
	//한개만 출력
	public BookDTO getBook(String num) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from BOOK where book_id=?";
		
		BookDTO dto = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BookDTO();
				dto.setBook_id(rs.getString("book_id"));//책아이디
				dto.setBook_name(rs.getString("book_name"));//책이름
				dto.setBook_image(rs.getString("book_image"));
				dto.setWriter(rs.getString("writer"));//저자
				dto.setContent(rs.getString("content"));//내용
				dto.setPublisher(rs.getString("publisher"));//출판사
				dto.setYear(Date.valueOf(rs.getString("year")));//출간년도
				dto.setEa(rs.getInt("ea"));//권수
				dto.setBookPrice(rs.getInt("book_price"));//책가격
				dto.setChapter(rs.getString("chapter"));//목차
				dto.setAccum(rs.getInt("accum"));//누적판매량
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	//베스트셀러 10개
	public ArrayList<BookDTO> getBestSeller(){
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from BOOK where book_name = (select book_name from BOOK order by accum limit 10)";
		
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BookDTO dto = getBook(rs.getString("book_id"));
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
	
	//insert
	public void insertBook(BookDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql ="insert into BOOK(book_name, book_image, writer, content, publisher, year, ea, book_price, chapter, accum) values(?,?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getBook_name());
			pstmt.setString(2, dto.getBook_image());
			pstmt.setString(3, dto.getWriter());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getPublisher());
			pstmt.setDate(6, dto.getYear());
			pstmt.setInt(7, dto.getEa());
			pstmt.setInt(8, dto.getBookPrice());
			pstmt.setString(9, dto.getChapter());
			pstmt.setInt(10, dto.getAccum());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
}
