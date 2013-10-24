package com.ketayao.ketacustom.generate.test.db;

import org.junit.Test;

import com.ketayao.ketacustom.generate.db.DataSource;
import com.ketayao.ketacustom.generate.db.DbFactory;
import com.ketayao.ketacustom.generate.util.ConvertHandler;
import com.ketayao.ketacustom.generate.vo.Table;


public class OracleTest {
	DataSource db = null;
	String t = "SYS_CODE";
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
