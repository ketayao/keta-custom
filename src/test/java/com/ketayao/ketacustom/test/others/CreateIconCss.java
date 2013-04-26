/**
 * <pre>
 * Copyright:		Copyright(C) 2012-2013, ketayao.com
 * Filename:		com.ketayao.test.others.CreateIconCss.java
 * Class:			CreateIconCss
 * Date:			2013-4-17
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          2.0.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.test.others;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;

import org.junit.Test;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  2.0.0
 * @since   2013-4-17 下午9:01:16 
 */

public class CreateIconCss {
	/**
	 * 项目根路径
	 */
	private static final String PROJECT_ROOT_PATH = CreateIconCss.class
			.getResource("/").getPath() + "../..";
	
	@Test
	public void create() throws Exception {
		String imgPath = PROJECT_ROOT_PATH + "/src/main/webapp/styles/management/themes/css/images/toolbar_icons16";
		File dir = new File(imgPath);
		File[] files = dir.listFiles();
		StringBuilder builder = new StringBuilder();
		for (File file : files) {
			builder.append(".panelBar .toolBar a." + file.getName().split("\\.")[0]
					+ " span { background-image: url(images/toolbar_icons16/" + file.getName() + "); background-position: 0 3px;}\n");
		}
		
		File all_icons = new File(PROJECT_ROOT_PATH + "/src/main/webapp/styles/management/themes/css/all_icons.css");
		OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(all_icons));
		writer.write(builder.toString());
		writer.flush();
		writer.close();
	}
}
