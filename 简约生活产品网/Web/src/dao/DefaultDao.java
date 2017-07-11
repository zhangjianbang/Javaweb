package dao;

import java.sql.*;

public class DefaultDao {
	private Connection con;

	public DefaultDao() {
		String drivername = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/mysqldb?useUnicode=true&characterEncoding=UTF-8";
		String username = "root";
		String password = "root";
		try {
			Class.forName(drivername);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.print("Çý¶¯³ÌÐò¼ÓÔØ´íÎó");
			e.printStackTrace();
		}
		try {
			con = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
		}
	}

	public ResultSet getResult(String sql) {
		Statement st = null;
		ResultSet rs = null;
		try {
			st = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
		}
		try {
			rs = st.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
		}
		return rs;
	}

	public int doDML(String sql) {
		Statement st = null;
		int i = 0;
		try {
			st = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			i = st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
}
