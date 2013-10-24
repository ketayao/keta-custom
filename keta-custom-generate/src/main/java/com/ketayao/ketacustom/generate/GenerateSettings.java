package com.ketayao.ketacustom.generate;

import java.io.IOException;

import com.ketayao.ketacustom.generate.util.FileUtils;
import com.ketayao.ketacustom.generate.util.FreeMarkers;
import com.ketayao.ketacustom.generate.util.Resources;

import freemarker.template.Template;

/** 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2013年10月23日 下午2:44:03 
 */
public class GenerateSettings extends AbstractGenerate {
	
	public GenerateSettings() {
		super();
	}
	
	public void generate(SettingsType settingsType) throws IOException {
		String dialect = "org.hibernate.dialect.MySQL5InnoDBDialect";
		if (Resources.JDBC_DRIVER.equals("oracle.jdbc.driver.OracleDriver")) {
			dialect = "org.hibernate.dialect.Oracle10gDialect";
		}
		model.put("dialect", dialect);
		model.put("jdbc_driver", Resources.JDBC_DRIVER);
		model.put("jdbc_url", Resources.JDBC_URL);
		model.put("jdbc_username", Resources.JDBC_USERNAME);
		model.put("jdbc_password", Resources.JDBC_PASSWORD);
		
		Template template = cfg.getTemplate("settings" + separator + settingsType.getTpl());
		String content = FreeMarkers.renderTemplate(template, model);
		String filePath = null;
		switch (settingsType) {
		case APPLICATION_CONTEXT:
		case JDBC:
		case LOGBACK:
			filePath = javaResourcesPath + settingsType.getName();
			break;
		case SPRING_MVC:
			filePath = webappPath + "WEB-INF" + separator + settingsType.getName();
			break;
		default:
			break;
		}
		
		FileUtils.writeFile(content, filePath);
		logger.info(settingsType.getName() + ": {}", filePath);
	}
	
	public enum SettingsType {
		APPLICATION_CONTEXT("applicationContext.xml", "applicationContext.xml.ftl"),
		JDBC("jdbc.properties", "jdbc.properties.ftl"),
		LOGBACK("logback.xml", "logback.xml.ftl"),
		SPRING_MVC("spring-mvc.xml", "spring-mvc.xml.ftl");
		
		private String name;
		private String tpl;
		
		private SettingsType (String name, String tpl) {
			this.name = name;
			this.tpl = tpl;
		}

		/**
		 * @return the name
		 */
		public String getName() {
			return name;
		}

		/**
		 * @return the tpl
		 */
		public String getTpl() {
			return tpl;
		}
	}
}
