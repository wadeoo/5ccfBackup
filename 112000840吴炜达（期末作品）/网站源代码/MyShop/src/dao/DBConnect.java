package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	public static Connection getConnecttion() {
		Connection cons = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			cons = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/shopping?serverTimezone=UTC", "root", "haosql");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cons;
	}
	
	public static void main(String[] args) {
		System.out.println(getConnecttion());
	}

}
