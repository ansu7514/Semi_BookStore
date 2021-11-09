package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

public class UserDAO {
	
	DBConnector db=new DBConnector();
	
	//insert
	public void insertUser(UserDTO dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into USER (user_id,user_pass,user_name,gender,birthday,addr,hp) values(?,?,?,?,?,?,?)";
	
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getUser_pass());
			pstmt.setString(3, dto.getUser_name());
			pstmt.setString(4, dto.getGender());
			pstmt.setDate(5, dto.getBirthday());
			pstmt.setString(6, dto.getAddr());
			pstmt.setString(7, dto.getHp());
			
			//실행
			pstmt.execute();
			
		} catch (SQLException e) {
			
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//아이디 체크 boolean _ 중복이면 true
	public boolean isIdCheck(String user_id)
	{
		
		boolean isid=false;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from USER where user_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, user_id);
			
			//실행
			rs=pstmt.executeQuery();
			
			if(rs.next()) 
			{
				//해당 id가 존재할 경우 true
				isid=true;
			}
			
		} catch (SQLException e) {
			
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return isid;
	}
	
	//전체 리스트
	public List<UserDTO> getAllDatas()
	{
		List<UserDTO>list=new Vector<UserDTO>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from USER";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				UserDTO dto=new UserDTO();
				
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pass(rs.getString("user_pass"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setGender(rs.getString("gender"));
				dto.setBirthday(rs.getDate("birthday"));
				dto.setPoint(rs.getInt("point"));
				dto.setAddr(rs.getString("addr"));
				dto.setHp(rs.getString("hp"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//비밀번호 체크 _ 입력성공하면 true
	public boolean isPassEqual(String user_id,String user_pass)
	{
		boolean b=false;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from USER where user_id=? and user_pass=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pass);
			
			//실행
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				b=true;
			}
			
		} catch (SQLException e) {
			
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return b;
	}
	
	//삭제 -> 회원탈퇴
	public void deleteUser(String user_id)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from USER where user_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			
			pstmt.execute();
			
		} catch (SQLException e) {
			
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//id에 해당하는 dto반환
	public UserDTO getUser(String user_id)
	{
		UserDTO dto=new UserDTO();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from USER where user_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);

			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pass(rs.getString("user_pass"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setGender(rs.getString("gender"));
				dto.setBirthday(rs.getDate("birthday"));
				dto.setPoint(rs.getInt("point"));
				dto.setAddr(rs.getString("addr"));
				dto.setHp(rs.getString("hp"));
			}
			
		} catch (SQLException e) {
			
		} finally {
			db.dbClose(pstmt, conn);
		}
		
		return dto;
	}
	
	//update
	public void updateUser(UserDTO dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		//사용자이름, 비밀번호, 생년월일, 전화번호, 주소 => 수정
		String sql="update USER	set user_name=?, user_pass=?, birthday=?, hp=?, addr=? where user_id=?";
	
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_name());
			pstmt.setString(2, dto.getUser_pass());
			pstmt.setDate(3, dto.getBirthday());
			pstmt.setString(4, dto.getHp());
			pstmt.setString(5, dto.getAddr());
			pstmt.setString(6, dto.getUser_id());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
}
