package com.ketayao.ketacustom.generate.test.db;

import org.junit.Test;

import com.ketayao.ketacustom.generate.db.DataSource;
import com.ketayao.ketacustom.generate.db.DbFactory;
import com.ketayao.ketacustom.generate.util.ConvertHandler;
import com.ketayao.ketacustom.generate.vo.Table;


public class MysqlTest {
	DataSource db = null;
	String t = "sys_user";
	@Test
	public void test(){
		try {
			db = DbFactory.create();
			Table table = db.getTable(t);
			System.out.println(table.getColumns().toString());
			ConvertHandler.tableHandle(table);
			System.out.println(table.getColumns().toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
