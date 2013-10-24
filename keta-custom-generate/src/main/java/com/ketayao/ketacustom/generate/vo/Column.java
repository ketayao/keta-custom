package com.ketayao.ketacustom.generate.vo;

public class Column {
	/********** JDBC **************/
	private String name;// 字段名
	private String type;// 字段类型
	private int size;// 长度
	private boolean nullable;// 是否允许空
	private String defaultValue;// 默认值
	private int digits;// 精度
	private String comment;// 备注
	/********** Java **************/
	private String javaType;// java type
	private String fieldName;// entity field名称
	private String setMethod;// set 方法名
	private String getMethod;// get 方法名
	private Table table;

	public int getDigits() {
		return digits;
	}

	public void setDigits(int digits) {
		this.digits = digits;
	}

	public String getDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isNullable() {
		return nullable;
	}

	public void setNullable(boolean nullable) {
		this.nullable = nullable;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getJavaType() {
		return javaType;
	}

	public void setJavaType(String javaType) {
		this.javaType = javaType;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public Table getTable() {
		return table;
	}

	public void setTable(Table table) {
		this.table = table;
	}

	public String getSetMethod() {
		return setMethod;
	}

	public void setSetMethod(String setMethod) {
		this.setMethod = setMethod;
	}

	public String getGetMethod() {
		return getMethod;
	}

	public void setGetMethod(String getMethod) {
		this.getMethod = getMethod;
	}

	@Override
	public String toString() {
		return "Column [comment=" + comment + ", defaultValue=" + defaultValue + ", digits=" + digits + ", fieldName=" + fieldName + ", javaType=" + javaType + ", name=" + name + ", nullable=" + nullable + ", size=" + size + ", table=" + table + ", type=" + type + "]";
	}

}
