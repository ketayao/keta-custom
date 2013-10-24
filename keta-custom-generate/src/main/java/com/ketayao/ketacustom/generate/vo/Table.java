package com.ketayao.ketacustom.generate.vo;

import java.util.List;

public class Table {

	private String tableName;

	private Column pk;// 主键

	private List<Column> fks;// 外键

	private String tableType;// view, table etc..

	private List<Column> columns;//所有列

	private String clazzName;// javabean name

	public Table() {
	}

	public Table(String tableName) {
		setTableName(tableName);
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public List<Column> getColumns() {
		return columns;
	}

	public void setColumns(List<Column> columns) {
		this.columns = columns;
	}

	public String getTableName() {
		return tableName;
	}

	public String getTableType() {
		return tableType;
	}

	public void setTableType(String tableType) {
		this.tableType = tableType;
	}

	public Column getPk() {
		return pk;
	}

	public void setPk(Column pk) {
		this.pk = pk;
	}

	public List<Column> getFks() {
		return fks;
	}

	public void setFks(List<Column> fks) {
		this.fks = fks;
	}

	public String getClazzName() {
		return clazzName;
	}

	public void setClazzName(String clazzName) {
		this.clazzName = clazzName;
	}

	@Override
	public String toString() {
		return "Table [clazzName=" + clazzName + ", columns=" + columns + ", fks=" + fks + ", pk=" + pk + ", tableName=" + tableName + ", tableType=" + tableType + "]";
	}

}
