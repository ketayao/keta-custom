package com.ketayao.ketacustom.generate.util;

import org.apache.commons.lang3.StringUtils;

import com.ketayao.ketacustom.generate.vo.Column;
import com.ketayao.ketacustom.generate.vo.Table;

/**
 * 转化器。将表名称、列名称、JDBC Type转换为Entity Name、Fields、Java Type
 * 
 */
public class ConvertHandler {
	/**
	 * 根据表名转换javabean 名称
	 * 
	 * @param table
	 * @throws Exception
	 */
	public static void tableHandle(Table table) throws Exception {
		if (table == null || table.getTableName() == null
				|| "".equals(table.getTableName()))
			throw new Exception(ConvertHandler.class.getName()
					+ ": 参数  Table 不能为null.");
		if (table.getColumns() == null || table.getColumns().size() == 0)
			throw new Exception(ConvertHandler.class.getName() + ":  表：[ "
					+ table.getTableName() + " ] ,不包含任何列信息...");
		/************** 生成类名 *******************/
		String clazzName = Resources.TPL_CLASS_NAME;// 配置文件中该表对应的类名
		if (StringUtils.isBlank(clazzName))
			clazzName = table2clazzName(table.getTableName());// 根据表名转换类名
		table.setClazzName(clazzName);
		/************** 数据库类型转JAVA类型 *******************/
		for (Column col : table.getColumns()) {
			columnHandler(col);
			if (col.getFieldName() == null)
				throw new Exception(ConvertHandler.class.getName()
						+ ": 转换column为field时出错,column:[" + col.getName() + "].");
		}

		/************** 验证主键 *******************/
		cleanColumn(table);
	}

	/**
	 * 变量名、类型、get、set方法转换
	 * 
	 * @param column
	 */
	public static void columnHandler(Column column) {
		if (column == null)
			return;
		// JDBC类型转换java类型
		column.setJavaType(JavaType.getJavaType(column.getType()));
		// column转换变量
		column.setFieldName(column2field(column.getName()));
		// get set方法
		String filedName = column.getFieldName();// table2clazzName(column.getFieldName());
		String methodName = filedName.substring(0, 1).toUpperCase()
				+ filedName.substring(1, filedName.length());
		column.setSetMethod("set" + methodName);
		if (column.getJavaType().equalsIgnoreCase("boolean"))
			column.setGetMethod("is" + methodName);
		else
			column.setGetMethod("get" + methodName);

	}

	/**
	 * 进行转换时，主键ID为Long 类型，pojo均继承IdEntity，所以pojo里不需要再次声明ID变量。
	 * 需要从columns中清除该列，避免pojo重复生成
	 */
	private static void cleanColumn(Table table) {
		if (table.getPk() != null && table.getColumns() != null) {
			for (Column col : table.getColumns()) {
				if (col.getName().equalsIgnoreCase(table.getPk().getName()))
					table.setPk(col);
			}
			table.getColumns().remove(table.getPk());
		}
	}

	/**
	 * 根据表转换类名
	 * 
	 * @param str
	 * @return
	 */
	public static String table2clazzName(String str) {
		if (str == null || "".equals(str))
			return null;
		String[] arrs = str.split("_");
		StringBuilder sb = new StringBuilder();
		for (String s : arrs) {
			sb.append(Character.toUpperCase(s.charAt(0))).append(
					s.substring(1).toLowerCase());
		}
		return sb.toString();
	}

	/**
	 * 根据编码习惯，column转换,"驼峰"规则作为pojo的变量，变量的首字母小写
	 * 
	 * @param str
	 * @return
	 */
	public static String column2field(String str) {
		if (str == null || "".equals(str))
			return null;
		str = str.toLowerCase();
		String[] arrs = str.split("_");
		if (arrs == null || arrs.length == 0)
			return null;
		StringBuilder sb = new StringBuilder();
		int len = arrs.length;
		sb.append(arrs[0]);
		if (len > 1) {
			for (int i = 1; i < len; i++) {
				String s = arrs[i];
				sb.append(Character.toUpperCase(s.charAt(0)));
				sb.append(s.substring(1));
			}
		}
		return sb.toString();
	}

	/**
	 * 根据实体获取实体对象
	 * 
	 * @param entityName
	 * @return
	 */
	public static String getEntityInstance(String entityName) {
		StringBuilder sb = new StringBuilder();
		sb.append(Character.toLowerCase(entityName.charAt(0))).append(
				entityName.substring(1));
		return sb.toString();
	}

}
