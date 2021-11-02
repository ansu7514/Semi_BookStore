package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnector {

	static final String MYSQLDRIVER="com.mysql.jdbc.Driver";
	static final String MYSQL_URL="jdbc:mysql://webservice.ct5m6xbkyvuw.ap-northeast-2.rds.amazonaws.com:3306/webservice?serverTimezone=Asia/Seoul";
	
	
	public DBConnector() {
		try {
			Class.forName(MYSQLDRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.err.println("알 수 없는 오류");
		}
	}

	//db연결
	public Connection getConnection() {
		Connection conn = null;
		
		try {
			conn = DriverManager.getConnection(MYSQL_URL, "su", "11111111");
		} catch(SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.err.println("알 수 없는 오류");
		}
		return conn;
	}

	public void dbClose(ResultSet rs,Statement stmt,Connection conn)
	{
	      try {
	    	  if(rs!=null) rs.close();
	    	  if(stmt!=null) stmt.close();
	    	  if(conn!=null) conn.close();
	      }catch (SQLException e) {
	    	  e.printStackTrace();
		}
	}
	
	public void dbClose(ResultSet rs,PreparedStatement pstmt,Connection conn)
	{
	      try {
	    	  if(rs!=null) rs.close();
	    	  if(pstmt!=null) pstmt.close();
	    	  if(conn!=null) conn.close();
	      }catch (SQLException e) {
	    	  e.printStackTrace();
		}
	}
	
	public void dbClose(Statement stmt,Connection conn)
	{
	      try {
	    	  
	    	  if(stmt!=null) stmt.close();
	    	  if(conn!=null) conn.close();
	      }catch (SQLException e) {
	    	  e.printStackTrace();
		}
	}
	
	public void dbClose(PreparedStatement pstmt,Connection conn)
	{
		try {
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
