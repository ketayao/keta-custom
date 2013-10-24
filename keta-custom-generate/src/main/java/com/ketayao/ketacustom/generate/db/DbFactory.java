package com.ketayao.ketacustom.generate.db;

import com.ketayao.ketacustom.generate.util.Resources;

/**
 * 获取数据库链接工厂
 * 2013-6-19
 */
public class DbFactory {

	/**
	 * 创建数据库实例
	 * 
	 * @param dialect
	 *            mysql,sqlserver,db2,oracle
	 * @return
	 * @throws Exception
	 */
	public static DataSource create() throws Exception {
		DataSource db = null;
		String dialect = Resources.JDBC_DRIVER;
		if (dialect == null || "".equals(dialect))
			throw new Exception(DbFactory.class.getName() + ":>>>请指定数据库dialect......");
		if ("com.mysql.jdbc.Driver".equals(dialect)){
			db = new Mysql();
		}else if("oracle.jdbc.driver.OracleDriver".equals(dialect)){
			db = new Oracle();
		}
			
		return db;
	}
}

