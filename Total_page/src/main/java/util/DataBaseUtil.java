package util;

import java.sql.Connection;
import java.sql.DriverManager;

//DB 접속을 구현한 클래스
public class DataBaseUtil {
	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "qwer1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
