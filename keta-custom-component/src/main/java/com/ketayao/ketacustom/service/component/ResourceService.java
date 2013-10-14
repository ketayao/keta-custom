/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.service.component.ResourceService.java
 * Class:			ResourceService
 * Date:			2013-6-28
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          3.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.service.component;

import java.util.List;

import com.ketayao.ketacustom.entity.component.Resource;
import com.ketayao.ketacustom.util.dwz.Page;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  3.1.0
 * @since   2013-6-28 上午10:19:01 
 */

public interface ResourceService {
	void save(Resource resource);
	
	void update(Resource resource);
	
	void delete(Long id);
	
	Resource get(Long id);
	
	Resource get(String uuid);
	
	List<Resource> findAll(Page page);
	
	List<Resource> findByName(Page page, String name);
	
	List<Resource> find(Page page);
}
