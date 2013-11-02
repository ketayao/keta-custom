package com.ketayao.ketacustom.generate.util;

import java.io.IOException;
import java.util.Properties;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 各类资源配置
 * 
 */
public class Resources {
	protected static Logger logger = LoggerFactory.getLogger(Resources.class);

	/************mysql 数据库配置 ************/
	public static String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	public static String JDBC_URL = "jdbc:mysql://localhost:3306/keta_custom?useUnicode=true&characterEncoding=UTF-8"; // 数据库访问串
	public static String JDBC_USERNAME = "root";
	public static String JDBC_PASSWORD = "root";
	
	public static String TPL_TABLE_NAME;
	public static String TPL_PACKAGE_NAME;
	//模块名，例：sys
	public static String TPL_MODULE_NAME;
	//子模块名（可选）
	public static String TPL_SUBMODULE_NAME;
	//类名，例：user
	public static String TPL_CLASS_NAME; 
	//功能名，例：用户
	public static String TPL_FUNCTION_NAME;
	//url映射前缀
	public static String TPL_REQUEST_MAPPING;
	//简单索引字段
	public static String TPL_INDEX_NAME;
	
	static {
		Properties pops = new Properties();
		try {
			pops.load(Resources.class.getResourceAsStream("/template_settings.properties"));
			// JDBC
			JDBC_DRIVER = pops.getProperty("jdbc.driver");
			JDBC_URL = pops.getProperty("jdbc.url");
			JDBC_USERNAME = pops.getProperty("jdbc.username");
			JDBC_PASSWORD = pops.getProperty("jdbc.password");
			
			// TPL模板参数
			TPL_TABLE_NAME = pops.getProperty("tpl.table.name");
			TPL_PACKAGE_NAME = pops.getProperty("tpl.package.name");  
			TPL_MODULE_NAME = pops.getProperty("tpl.module.name");
			TPL_SUBMODULE_NAME = pops.getProperty("tpl.submodule.name");
			TPL_CLASS_NAME = pops.getProperty("tpl.class.name");
			TPL_FUNCTION_NAME = pops.getProperty("tpl.function.name");
			TPL_REQUEST_MAPPING = pops.getProperty("tpl.request.mapping");
			TPL_INDEX_NAME = pops.getProperty("tpl.index.name");
			
			if (StringUtils.isBlank(TPL_PACKAGE_NAME) 
					|| StringUtils.isBlank(TPL_MODULE_NAME)
					|| StringUtils.isBlank(TPL_CLASS_NAME)
					|| StringUtils.isBlank(TPL_FUNCTION_NAME)
					|| StringUtils.isBlank(TPL_INDEX_NAME)) {
				logger.error("参数设置错误：表名、包名、模块名、类名、功能名、索引字段不能为空。");
				System.exit(-1);
			}

			PKN_ENTITY = TPL_PACKAGE_NAME + ".entity";
			PKN_DAO = TPL_PACKAGE_NAME + ".dao";
			PKN_SERVICE = TPL_PACKAGE_NAME + ".service";
			PKN_SERVICE_IMPL = TPL_PACKAGE_NAME + ".service.impl";
			PKN_CONTROLLER = TPL_PACKAGE_NAME + ".controller";
			if (StringUtils.isNotBlank(TPL_SUBMODULE_NAME) && StringUtils.isBlank(TPL_REQUEST_MAPPING)) {
				TPL_REQUEST_MAPPING = "management/" + TPL_MODULE_NAME + "/" + TPL_SUBMODULE_NAME + "/" + StringUtils.uncapitalize(TPL_CLASS_NAME);
			} else if (StringUtils.isBlank(TPL_REQUEST_MAPPING)) {
				TPL_REQUEST_MAPPING = "management/" + TPL_MODULE_NAME + "/" + StringUtils.uncapitalize(TPL_CLASS_NAME);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 包名配置
	public static String PKN_ENTITY;
	public static String PKN_DAO;
	public static String PKN_SERVICE;
	public static String PKN_SERVICE_IMPL;
	public static String PKN_CONTROLLER;

	/************ 模板配置 ************/
	public static final String TEMPLATE_PATH = "src/template/";
	
	public static final String JAVA_ENTITY_TEMPLATE = "java_entity.ftl";
	public static final String JAVA_DAO_TEMPLATE = "java_dao.ftl";
	public static final String JAVA_SERVICE_TEMPLATE = "java_service.ftl";
	public static final String JAVA_SERVICE_IMPL_TEMPLATE = "java_service_impl.ftl";
	public static final String JAVA_CONTROLLER_TEMPLATE = "java_controller.ftl";

	public static final String JSP_LIST_TEMPLATE = "jsp_list.ftl";
	public static final String JSP_CREATE_TEMPLATE = "jsp_create.ftl";
	public static final String JSP_UPDATE_TEMPLATE = "jsp_update.ftl";
	public static final String JSP_VIEW_TEMPLATE = "jsp_view.ftl";
}
