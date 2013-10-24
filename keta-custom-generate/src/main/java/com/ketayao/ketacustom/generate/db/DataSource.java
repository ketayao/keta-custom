package com.ketayao.ketacustom.generate.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.ketayao.ketacustom.generate.vo.Table;

/**
 * 用于数据库操作。主要包括读取数据库表相关信息
 * 2013-6-19
 */
public abstract class DataSource {

	protected String[] types = new String[] { "TABLE" };
	protected Connection conn = null;

	/**
	 * 获取指定表的表结构。通过java.sql.Connction接口实现。子类可以重载这个方法
	 * 
	 * @param tableName
	 *            查询的表的名称
	 * @return 表的基本结构，包括表名，列以及列熟悉列表
	 * @throws SQLException
	 */
	public abstract Table getTable(String tableName) throws SQLException;

	/**
	 * 获取数据库所有表名称
	 * 
	 * @return
	 * @throws SQLException
	 */
	public abstract List<Table> getTables() throws SQLException;

	public DataSource(Connection conn) {
		this.conn = conn;
	}

	public DataSource() {
		if (conn == null) {
			conn = new DbConnection().getConn();
		}
	}

	protected void connectionTest(Connection conn) throws SQLException {
		if (conn == null)
			throw new SQLException(DataSource.class.getName() + ":>>>>数据库未连接！");
	}

	protected void close(Connection conn, PreparedStatement pstmt, ResultSet rs) throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}

}
