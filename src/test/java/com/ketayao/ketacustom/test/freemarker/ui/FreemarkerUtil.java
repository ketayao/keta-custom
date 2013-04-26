package com.ketayao.ketacustom.test.freemarker.ui;

import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public abstract class FreemarkerUtil {
	private static Configuration configuration;

	private static final String TEMPLATE_DIR = FreemarkerUtil.class
			.getResource("/").getPath() + "../..";

	public static Template getTemplate(String ftl) {
		try {
			return getConfiguration().getTemplate(
					"target/test-classes/com/ketayao/test/freemarker/ui/ftl/"
							+ ftl);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static synchronized Configuration getConfiguration() {
		if (configuration == null) {
			try {

				Properties properties = new Properties();
				properties.load(FreemarkerUtil.class
						.getResourceAsStream("/freemarker.properties"));

				configuration = new Configuration();
				configuration.setSettings(properties);
				configuration.setDirectoryForTemplateLoading(new File(
						TEMPLATE_DIR));
				configuration.setObjectWrapper(new DefaultObjectWrapper());

				Map<String, String> map = new HashMap<String, String>();
				map.put("dwz", "src/main/webapp/WEB-INF/ui/dwz.ftl");

				configuration.addAutoImport("dwz",
						"src/main/webapp/WEB-INF/ui/index.ftl");
			} catch (IOException e) {
				e.printStackTrace();
			} catch (TemplateException e) {
				e.printStackTrace();
			}
		}

		return configuration;
	}

	public static String execute(Template template, Map<?, ?> rootMap) {
		Writer out = new BufferedWriter(new OutputStreamWriter(System.out));
		StringWriter out2 = new StringWriter();
		try {
			template.process(rootMap, out);
			template.process(rootMap, out2);

			out.flush();
			
			out2.flush();
			out2.close();
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return out2.getBuffer().toString();
	}

	
}
