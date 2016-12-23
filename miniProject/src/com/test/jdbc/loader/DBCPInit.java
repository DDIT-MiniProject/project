package com.test.jdbc.loader;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class DBCPInit extends DataSource{
	private static DBCPInit instance=new DBCPInit();
	private DBCPInit(){}
	public static DBCPInit getInstance(){
		return instance;
	}
	
	static{
		try {
			String drivers = "oracle.jdbc.driver.OracleDriver";
			StringTokenizer st = new StringTokenizer(drivers, ",");
			while (st.hasMoreTokens()) {
				String jdbcDriver = st.nextToken();
				Class.forName(jdbcDriver);
			}
			Class.forName("org.apache.commons.dbcp.PoolingDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Connection getConnection() {
		Connection conn=null;
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:/guestbook");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

}
