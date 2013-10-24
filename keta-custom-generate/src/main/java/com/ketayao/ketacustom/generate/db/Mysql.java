package com.ketayao.ketacustom.generate.db;

import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ketayao.ketacustom.generate.vo.Column;
import com.ketayao.ketacustom.generate.vo.Table;

/**
 *  Mysql Metadata读取
 * 2013-6-19
 */
public class Mysql extends DataSource {

	@Override
	public Table getTable(String tableName) throws SQLException {
		connectionTest(conn);
		Table t = new Table(tableName);
		ResultSet rs = null;
		t.setColumns(new ArrayList<Column>());
		try {
			DatabaseMetaData dmd = conn.getMetaData();// 获取数据库的MataData信息
			rs = dmd.getColumns(null, "", tableName, "");
			getColumns(rs, t);
			rs = dmd.getPrimaryKeys(null, null, tableName);
			t.setPk(getPk(rs));
		} catch (SQLException e) {
			throw e;
		} finally {
			close(conn, null, rs);
		}
		return t;
	}

	/**
	 * 获取所有列
	 * 
	 * @param rs
	 * @param t
	 * @throws SQLException
	 */
	private void getColumns(ResultSet rs, Table t) throws SQLException {
		while (rs.next()) {
			// 这里没有提供获取当前列是否主键/外键的信息提示
			Column col = new Column();
			col.setName(rs.getString("COLUMN_NAME"));
			col.setType(rs.getString("TYPE_NAME"));
			col.setSize(rs.getInt("COLUMN_SIZE"));
			col.setNullable(rs.getBoolean("NULLABLE"));
			col.setDigits(rs.getInt("DECIMAL_DIGITS"));
			col.setDefaultValue(rs.getString("COLUMN_DEF"));
			col.setComment(rs.getString("REMARKS"));
			t.getColumns().add(col);
		}
	}

	/**
	 * 获取主键
	 * 
	 * @param rs
	 * @return
	 * @throws SQLException
	 */
	private Column getPk(ResultSet rs) throws SQLException {
		Column pk = new Column();
		// ResultSetMetaData rsmd = rs.getMetaData();
		// int columnsCount = rsmd.getColumnCount();
		while (rs.next()) {
			pk.setName(rs.getString("COLUMN_NAME"));
			// System.out.println(rs.getString("COLUMN_NAME"));
		}
		return pk;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<Table> getTables() throws SQLException {
		this.connectionTest(conn);
		List<Table> tables = null;
		ResultSet rs = null;
		try {
			DatabaseMetaData dmd = conn.getMetaData();
			rs = dmd.getTables("", "", "%", null);
			tables = new ArrayList();
			while (rs.next()) {
				Table t = new Table();
				t.setTableName(rs.getString("TABLE_NAME"));
				tables.add(t);
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			close(conn, null, rs);
		}
		return tables;
	}

}
