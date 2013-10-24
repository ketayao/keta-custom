package com.ketayao.ketacustom.generate.test.util;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.ketayao.ketacustom.generate.util.ConvertHandler;
import com.ketayao.ketacustom.generate.vo.Table;

public class ConvertTest {

	@Test
	public void test(){
		try {
			Table t = new Table();
			t.setTableName(" ");
			ConvertHandler.tableHandle(t);
		} catch (Exception e) {
			e.printStackTrace();
		}
		assertEquals("sysRole", ConvertHandler.getEntityInstance("SysRole"));
	}
}
