package com.javalec.ex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

	public static final int MEMBER_LOGIN_SUCCESS = 1;	//로그인 성공
	public static final int MEMBER_LOGIN_PW_NO = 0;		//비밀번호가 다름
	public static final int MEMBER_LOGIN_IS_NOT = -1;	//아이디가 다름
	public static final int MEMBER_JOIN_SUCCESS = 1;	
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_NONEXISTENT = 0;
	
	private static MemberDAO instance = new MemberDAO();
	
	public MemberDAO() {
		
	}

	public static MemberDAO getInstance(){
		return instance;
	}
	public int userCheck(String id, String pw) {
		int ri = 0;
		String dbPW;
		
		Connection connection = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String query = "select pw from members where id = ?";
		
		try {
			
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "scott" , "tiger");
			stmt = connection.prepareStatement(query);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			
			if(rs.next())
			{
				dbPW = rs.getString("pw");
				if(dbPW.equals(pw)) {
					ri = MemberDAO.MEMBER_LOGIN_SUCCESS;
				}else {
					ri = MemberDAO.MEMBER_LOGIN_PW_NO;
				}
			}
			else {
				ri = MemberDAO.MEMBER_LOGIN_IS_NOT;
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally {
			try {
				 rs.close();
				 stmt.close();
				 connection.close();
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return ri;
	}
	
	public int confirmId(String id) {
		int ri = 0;
		
		Connection connection = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String query = "select id from members where id = ?";
		
		try {
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "scott" , "tiger");
			stmt = connection.prepareStatement(query);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			
			if(rs.next())
				ri = MEMBER_EXISTENT;
			else
				ri = MEMBER_NONEXISTENT;
			
		}catch (Exception e2) {
			e2.printStackTrace();
		}finally {
			try {
			rs.close();
			stmt.close();
			connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return ri;
	}
	
	public int insertMember(MemberDTO dto) {
		int ri = 0;
		
		Connection connection = null;
		PreparedStatement stmt= null;
		String query = "insert into members values(?,?,?,?,?)";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "scott" , "tiger");
			stmt = connection.prepareStatement(query);
			stmt.setString(1, dto.getId());
			stmt.setString(2, dto.getPw());
			stmt.setString(3, dto.getName());
			stmt.setString(4, dto.geteMail());
			stmt.setString(5, dto.getAddress());
			stmt.executeUpdate();
			ri = MEMBER_JOIN_SUCCESS;
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(connection != null) connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return ri;
	}
	
	public MemberDTO getMember(String id) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select * from members where id = ?";
		MemberDTO dto = null;
		
		try {
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "scott" , "tiger");
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			
			if(set.next()) {
				dto = new MemberDTO();
				dto.setId(set.getString("id"));
				dto.setPw(set.getString("pw"));
				dto.setName(set.getString("name"));
				dto.seteMail(set.getString("eMail"));
				dto.setAddress(set.getString("address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dto;
	}
	
	public int UpdateMember(MemberDTO dto) {
		int ri=0;
		
		Connection connection = null;
		PreparedStatement stmt= null;
		String query = "Update members set pw =?, eMail=?, address=? where id =?";
		
		try {
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "scott" , "tiger");
			stmt = connection.prepareStatement(query);
			stmt.setString(1, dto.getPw());
			stmt.setString(2,dto.geteMail());
			stmt.setString(3,dto.getAddress());
			stmt.setString(4,dto.getId());
			ri = stmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				stmt.close();
				connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return ri;
	}
}

