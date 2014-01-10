package com.ketayao.ketacustom.generate;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;

/** 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2014年1月9日 下午5:06:18 
 */
public class CopyCommonFile extends AbstractGenerate {
	
	public void copy() throws IOException {
		// 拷贝keta-custom-resources中的tld文件夹和include.inc.jsp文件
		logger.info("projectFile.getParentFile:" + projectFile.getParentFile());
		File resources = new File(projectFile.getParentFile(), "keta-custom-resources");
		
		// tld文件路径
		String tldPath = StringUtils.replace(resources + "/src/main/webapp/WEB-INF/tld/", "/", separator);
		logger.info("keta-custom-resources tld Path: {}", tldPath);
		
		File destDir = new File(this.webappPath + this.separator + "WEB-INF" + this.separator + "tld");
		if (!destDir.exists() || destDir.listFiles().length < 1) {
			File srcDir = new File(tldPath);
			FileUtils.copyDirectory(srcDir, destDir);
		}		
		
		// 视图文件路径
		String resourcesViewPath = StringUtils.replace(resources + "/src/main/webapp/WEB-INF/views/", "/", separator);
		logger.info("keta-custom-resources View Path: {}", resourcesViewPath);
		
		String incJsp = "include.inc.jsp";
		File includeFile = new File(this.viewPath + incJsp);
		if (!includeFile.exists()) {
			FileUtils.copyFileToDirectory(new File(resourcesViewPath + "include.inc.jsp"), new File(this.viewPath));
		}
	}
}
