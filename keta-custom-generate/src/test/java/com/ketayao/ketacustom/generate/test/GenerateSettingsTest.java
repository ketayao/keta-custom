package com.ketayao.ketacustom.generate.test;

import org.junit.Test;

import com.ketayao.ketacustom.generate.GenerateSettings;
import com.ketayao.ketacustom.generate.GenerateSettings.SettingsType;

/** 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2013年10月23日 下午3:48:19 
 */
public class GenerateSettingsTest {
	@Test
	public void testAppContext() {
		try {
			new GenerateSettings().generate(SettingsType.APPLICATION_CONTEXT);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testJDBC() {
		try {
			new GenerateSettings().generate(SettingsType.JDBC);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testLog() {
		try {
			new GenerateSettings().generate(SettingsType.LOGBACK);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testMVC() {
		try {
			new GenerateSettings().generate(SettingsType.SPRING_MVC);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
