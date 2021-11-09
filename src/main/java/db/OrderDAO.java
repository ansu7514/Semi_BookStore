package db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class OrderDAO {

	DBConnector db = new DBConnector();
	
	//한권 주문 (주문 성공하면 true)
	public void insertOrder(OrderDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		boolean isOrder = false;
		
		//주문삽입
		String sql = "insert into ORDERED values(null, ?, ?, ?, ?, ?, now(), ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getBook_id());
			pstmt.setString(3, dto.getRecipient());
			pstmt.setString(4, dto.getLocation());
			pstmt.setInt(5, dto.getBook_price());
			pstmt.setInt(6, dto.getEa());
			pstmt.setString(7, dto.getPay_method());
			pstmt.setInt(8, dto.getUse_point());
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//포인트 업데이트 point = (price-usepoint) * 0.02 + (point-usepoint)
		sql = "update USER set point=(?-?)*0.02+((select point from USER where user_id=?)-?) where user_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBook_price());
			pstmt.setInt(2, dto.getUse_point());
			pstmt.setString(3, dto.getUser_id());
			pstmt.setInt(4, dto.getUse_point());
			pstmt.setString(5, dto.getUser_id());
			
			pstmt.executeUpdate();
			isOrder = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//카트에서 삭제
		sql = "delete from CART where user_id=? and book_id=?";
		
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
	
	//여러권 주문 (주문 성공하면 true)
	public boolean insertOrders(ArrayList<OrderDTO> order_list) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		boolean isOrder = false;
		
		for(OrderDTO order : order_list) {
			insertOrder(order);
		}
		isOrder = true;

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
				dto.setRecipient(rs.getString("recipient"));
				dto.setLocation(rs.getString("location"));
				dto.setBook_price(Integer.parseInt(rs.getString("book_price")));
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
	
	//구매내역 조회
		public ArrayList<OrderDTO> orderSelectList(String order_id){
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
			
			String sql = "select * from ORDERED where order_id=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, order_id);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					OrderDTO dto = new OrderDTO();
					dto.setOrder_id(rs.getString("order_id"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setBook_id(rs.getString("book_id"));
					dto.setRecipient(rs.getString("recipient"));
					dto.setLocation(rs.getString("location"));
					dto.setBook_price(Integer.parseInt(rs.getString("book_price")));
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
		
		//최종 추가된 시퀀스 order_id값 리턴
		public String getMaxnum()
		{
			OrderDTO dto=new OrderDTO();
			String order_id="";
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select max(order_id) from ORDERED";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				rs=pstmt.executeQuery();
				
				if(rs.next())
				{
					order_id=rs.getString(1);
				}
				
			} catch (SQLException e) {
				
			} finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return order_id;
		}
		
	
	//특정기간 주문조회
	public ArrayList<OrderDTO> orderDateList(String user_id, Date from, Date to){
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		
		String sql = "select * from ORDERED where user_id=? and pay_day between ? and ?";
		
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
				dto.setRecipient(rs.getString("recipient"));
				dto.setLocation(rs.getString("location"));
				dto.setBook_price(Integer.parseInt(rs.getString("book_price")));
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
	
	//페이징처리 _ 1) 전체 갯수 구하기
	public int getTotalCount()
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from ORDERED";
		
		int n=0;
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next())
				n=rs.getInt(1);
			
		} catch (SQLException e) {
			
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return n;
	}
	
	//페이징처리 _ 2) 페이징에 필요한 리스트만 보내기
	public List<OrderDTO>getList(String user_id, int start, int perpage)
	{
		
	List<OrderDTO>list=new Vector<OrderDTO>();
	
	Connection conn=db.getConnection();
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="select * from ORDERED where user_id=? order by order_id limit ?,?";
	
	try {
		pstmt=conn.prepareStatement(sql);
		
		//바인딩
		pstmt.setString(1, user_id);
		pstmt.setInt(2, start);
		pstmt.setInt(3, perpage);
		
		//실행
		rs=pstmt.executeQuery();
		
		while(rs.next())
		{
			OrderDTO dto=new OrderDTO();
			
			dto.setOrder_id(rs.getString("order_id"));
			dto.setUser_id(rs.getString("user_id"));
			dto.setBook_id(rs.getString("book_id"));
			dto.setRecipient(rs.getString("recipient"));
			dto.setLocation(rs.getString("location"));
			dto.setBook_price(Integer.parseInt(rs.getString("book_price")));
			dto.setPayDay(rs.getDate("pay_day"));
			dto.setEa(rs.getInt("ea"));
			dto.setPay_method(rs.getString("pay_method"));
			
			//리스트에 추가
			list.add(dto);
		}
		
	} catch (SQLException e) {
		
	} finally {
		db.dbClose(rs, pstmt, conn);
	}
	
	return list;
	}
}