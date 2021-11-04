package db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderDAO {

	DBConnector db = new DBConnector();
	
	//한권 주문 (주문 성공하면 true)
	public boolean insertOrder(OrderDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		boolean isOrder = false;
		
		String sql = "insert into ORDERED values(null, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getBook_id());
			pstmt.setString(3, dto.getRecipent());
			pstmt.setString(4, dto.getLocation());
			pstmt.setDate(5, dto.getPayDay());
			pstmt.setInt(6, dto.getEa());
			pstmt.setString(7, dto.getPay_method());
			
			pstmt.executeUpdate();
			isOrder = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return isOrder;
	}
	
	//여러권 주문 (주문 성공하면 true)
	public boolean insertOrders(ArrayList<OrderDTO> order_list) {
		boolean isOrder = false;
		
		for(OrderDTO order : order_list) {
			isOrder = insertOrder(order);
		}
		return isOrder;
	}
	
	//전체주문조회
	public ArrayList<OrderDTO> orderList(String user_id){
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		
		String sql = "select * from ORDERED where user_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				dto.setOrder_id(rs.getString("order_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setBook_id(rs.getString("book_id"));
				dto.setRecipent(rs.getString("recipient"));
				dto.setLocation(rs.getString("location"));
				dto.setPayDay(rs.getDate("pay_day"));
				dto.setEa(rs.getInt("ea"));
				dto.setPay_method(rs.getString("pay_method"));
				
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
	
	//특정기간 주문조회
	public ArrayList<OrderDTO> orderDateList(String user_id, Date from, Date to){
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		
		String sql = "select * from ORDERED wehre user_id=? and pay_day between ? and ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			pstmt.setDate(2, from);
			pstmt.setDate(3, to);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				dto.setOrder_id(rs.getString("order_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setBook_id(rs.getString("book_id"));
				dto.setRecipent(rs.getString("recipient"));
				dto.setLocation(rs.getString("location"));
				dto.setPayDay(rs.getDate("pay_day"));
				dto.setEa(rs.getInt("ea"));
				dto.setPay_method(rs.getString("pay_method"));
				
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