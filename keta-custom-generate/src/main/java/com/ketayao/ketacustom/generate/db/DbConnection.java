package com.ketayao.ketacustom.generate.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.ketayao.ketacustom.generate.util.Resources;

/**
 * 获取数据库链接
 * 2013-6-19
 */
public class DbConnection {
	
	public Connection getConn() {
		Connection conn = null;
		try {
			Class.forName(Resources.JDBC_DRIVER).newInstance();
			conn = DriverManager.getConnection(Resources.JDBC_URL, Resources.JDBC_USERNAME, Resources.JDBC_PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return conn;
	}

}
