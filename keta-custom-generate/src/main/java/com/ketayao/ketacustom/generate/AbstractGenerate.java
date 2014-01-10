package com.ketayao.ketacustom.generate;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.DefaultResourceLoader;

import com.ketayao.ketacustom.generate.util.Resources;

import freemarker.template.Configuration;

/** 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2013年10月23日 下午2:45:54 
 */
public abstract class AbstractGenerate {
	protected static Logger logger = LoggerFactory.getLogger(AbstractGenerate.class);
	
	protected Configuration cfg;
	protected String tplPath;
	protected String javaPath;
	protected String javaResourcesPath;
	protected String testJavaPath;
	protected String testJavaResourcesPath;
	protected String viewPath;
	protected String webappPath;
	protected String projectName;
	
	protected String separator;
	
	// 工程文件
	protected File projectFile;
	
	protected Map<String, Object> model;
	
	public AbstractGenerate() {
		init();
	}
	
	public void init() {
		try {
			// 获取文件分隔符
			separator = File.separator;

			// 获取工程路径
			projectFile = new DefaultResourceLoader().getResource("").getFile();
			
//			while (!new File(projectPath.getPath() + separator + "src" + separator + "main").exists()) {
//				projectPath = projectPath.getParentFile();
//			}
			
			while (!new File(projectFile.getPath() + separator + "pom.xml").exists()) {
				projectFile = projectFile.getParentFile();
			}
			
			String projectPath = projectFile.getAbsolutePath();
			
			logger.info("Project Path: {}", projectPath);
			
			// 项目名称
			projectName = StringUtils.substring(projectPath.toString(), projectPath.toString().lastIndexOf(separator) + 1);
			logger.info("projectName : {}", projectName);
			
			// 模板文件路径
			//tplPath = StringUtils.replace(projectPath + "/src/main/resources/template", "/", separator);
			tplPath = StringUtils.replace(URLDecoder.decode(AbstractGenerate.class.getResource("/template").getPath(), "utf-8"), "/", separator);
			logger.info("Template Path: {}", tplPath);

			// Java文件路径
			javaPath = StringUtils.replace(projectPath + "/src/main/java/", "/", separator);
			logger.info("Java Path: {}", javaPath);
			
			// javaResources路径
			javaResourcesPath = StringUtils.replace(projectPath + "/src/main/resources/", "/", separator);
			logger.info("javaResources Path: {}", javaResourcesPath);
			
			// Java test文件路径
			testJavaPath = StringUtils.replace(projectPath + "/src/test/java/", "/", separator);
			logger.info("testJava Path: {}", testJavaPath);
			
			// javaResources test路径
			testJavaResourcesPath = StringUtils.replace(projectPath + "/src/test/resources/", "/", separator);
			logger.info("testJavaResources Path: {}", testJavaResourcesPath);
			
			// webappPath路径
			webappPath = StringUtils.replace(projectPath + "/src/main/webapp/", "/", separator);
			logger.info("webapp Path: {}", webappPath);
			
			// 视图文件路径
			viewPath = StringUtils.replace(projectPath + "/src/main/webapp/WEB-INF/views/", "/", separator);
			logger.info("View Path: {}", viewPath);
			
			// 代码模板配置
			cfg = new Configuration();
			cfg.setDefaultEncoding("UTF-8");
			cfg.setDateFormat("yyyy-MM-dd HH:mm:ss");
			cfg.setNumberFormat("#0.#");
			
			cfg.setDirectoryForTemplateLoading(new File(tplPath));

			// 定义模板变量
			model = new HashMap<String, Object>();
			model.put("packageName", Resources.TPL_PACKAGE_NAME);
			model.put("className", Resources.TPL_CLASS_NAME);
			model.put("instanceName", StringUtils.uncapitalize(Resources.TPL_CLASS_NAME));
			model.put("functionName", Resources.TPL_FUNCTION_NAME);
			model.put("requestMapping", Resources.TPL_REQUEST_MAPPING);
			model.put("indexName", Resources.TPL_INDEX_NAME);
			
			model.put("pknEntity", Resources.PKN_ENTITY);
			model.put("pknDAO", Resources.PKN_DAO);
			model.put("pknService", Resources.PKN_SERVICE);
			model.put("pknServiceImpl", Resources.PKN_SERVICE_IMPL);
			model.put("pknController", Resources.PKN_CONTROLLER);
			
			model.put("projectName", projectName);
		} catch (IOException e) {
			e.printStackTrace();
		}
	};
}
