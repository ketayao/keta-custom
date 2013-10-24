package com.ketayao.ketacustom.generate.test;

import org.junit.Before;
import org.junit.Test;

import com.ketayao.ketacustom.generate.Generate;
import com.ketayao.ketacustom.generate.GenerateCode;
import com.ketayao.ketacustom.generate.db.DataSource;
import com.ketayao.ketacustom.generate.db.DbFactory;
import com.ketayao.ketacustom.generate.util.ConvertHandler;
import com.ketayao.ketacustom.generate.util.FileType;
import com.ketayao.ketacustom.generate.vo.Table;

public class GenerateCodeTest {

	private Generate gen;
	DataSource db = null;
	String t = "ss_task";
	Table table = null;

	@Before
	public void before() {
		try {
			db = DbFactory.create();
			table = db.getTable(t);
			ConvertHandler.tableHandle(table);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testEntity() {
		try {
			gen = new GenerateCode(FileType.ENTITY);
			gen.generate(table);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testDao() {
		try {
			gen = new GenerateCode(FileType.DAO);
			gen.generate(table);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testService() {
		try {
			gen = new GenerateCode(FileType.SERVICE);
			gen.generate(table);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testServiceImpl() {
		try {
			gen = new GenerateCode(FileType.SERVICE_IMPL);
			gen.generate(table);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testController() {
		try {
			gen = new GenerateCode(FileType.CONTROLLER);
			gen.generate(table);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testJspCreate() {
		try {
			gen = new GenerateCode(FileType.JSP_CREATE);
			gen.generate(table);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testJspList() {
		try {
			gen = new GenerateCode(FileType.JSP_LIST);
			gen.generate(table);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testJspUpdate() {
		try {
			gen = new GenerateCode(FileType.JSP_UPDATE);
			gen.generate(table);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testView() {
		try {
			gen = new GenerateCode(FileType.JSP_VIEW);
			gen.generate(table);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
