package user;

import java.sql.*;

import util.DatabaseUtil;

//DAO(Data Access Object
//데이터베이스의 data에 접근하기 위한 객체
//DataBase에 접근 하기 위한 로직을 분리하기 위해 사용된다.
public class UserDAO {
	Connection conn = DatabaseUtil.getConnection();
	String result = null;
	ResultSet rs = null;
	
	public int join(String userID, String userPassword, String userName) {
		String SQL = "INSERT INTO USER_INFO VALUES (?, ?, ?, ?)";
		try {
			//각각의 데이터를 실제로 넣어준다.
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			//쿼리문의 ? 안에 각각의 데이터를 넣어준다.
			pstmt.setString(1, null);
			pstmt.setString(2, userID);
			pstmt.setString(3, userPassword);
			pstmt.setString(4, userName);
			
			//명령어를 수행한 결과 반환, 반환값 : insert가 된 데이터의 개수
			return pstmt.executeUpdate();
			//INSERT, DELETE, UPDATE 관련 구문에서는 반영된 레코드의 건수를 반환한다.
			//CREATE, DROP 관련 구문에서는 -1을 반환한다.
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int Select(String userID, String userPassword) {
		String SQL = String.format("SELECT * FROM test.user_info where user_id = '%s'", userID);
		Statement stmt = null;
		int result = 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL);
			result = confirm_data(rs, userID, userPassword);
			return result;
		}catch(Exception e) {
			
		}
		return -1;
	}
	
	public int confirm_data(ResultSet rs, String userID, String userPassword) throws SQLException {
		int result = 0;
		int index = 0;
		while(rs.next()) {
			index = 1;
			String id = rs.getString("user_id");
			String pw = rs.getString("user_pw");
			if(!userID.equals("")) {
				if(id.equals(userID))
					result++;
			}
			if(!userPassword.equals("")) {
				if(pw.equals(userPassword))
					result++;
			}
		}
		if(result == 2)
			return result;
		else
			return -1;
	}
}
