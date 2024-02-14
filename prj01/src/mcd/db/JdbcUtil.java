package mcd.db;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JdbcUtil {
	{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
		}
	}

	public static Connection getConnection() {
		Connection con = null;
		try {
			String url = "jdbc:oracle:thin:@LOCALHOST:1521:XE";
			con = DriverManager.getConnection(url, "TEST", "1111");
//			con.setAutoCommit(false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public static void close(Connection con) {
		try {
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void close(Statement stmt) {
		try {
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void close(ResultSet rs) {
		try {
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
