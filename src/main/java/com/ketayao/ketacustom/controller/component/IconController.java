/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.controller.component.IconController.java
 * Class:			IconsController
 * Date:			2013-7-8
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          3.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.controller.component;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ketayao.ketacustom.util.dwz.FileUtils;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  3.1.0
 * @since   2013-7-8 上午9:03:03 
 */
@Controller
@RequestMapping("/management/component/icon")
public class IconController {
	
	private static final String LIST = "management/component/icon/list";
	
	private static List<String> iconNames = null;
	
	@RequiresPermissions("Icon:view")
	@RequestMapping(value="/list", method={RequestMethod.GET, RequestMethod.POST})
	public String list(HttpServletRequest request, Map<String, Object> map) {
		
		String webPath = request.getSession().getServletContext().getRealPath("/");
		String imgPath = webPath + "/styles/management/themes/css/images/toolbar_icons16";
		
		File dir = new File(imgPath);
		File[] files = dir.listFiles();
		
		if (iconNames == null) {
			iconNames = new ArrayList<String>();
			for (File file : files) {
				iconNames.add(FileUtils.getRealName(file.getName()));
			}
		}
		
		map.put("iconNames", iconNames);
		return LIST;
	}
	
	@RequiresPermissions("Icon:view")
	@RequestMapping(value="/reload", method={RequestMethod.GET, RequestMethod.POST})
	public String reload(HttpServletRequest request, Map<String, Object> map) {
		iconNames = null;
		return list(request, map);
	}
}
