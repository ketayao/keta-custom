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

import org.springframework.data.jpa.domain.Specification;

import com.ketayao.ketacustom.entity.component.Resource;
import com.ketayao.ketacustom.util.dwz.Page;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  3.1.0
 * @since   2013-6-28 上午10:19:01 
 */

public interface ResourceService {
	Resource get(Long id);

	void saveOrUpdate(Resource resource);

	void delete(Long id);
	
	List<Resource> findAll(Page page);
	
	List<Resource> findByExample(Specification<Resource> specification, Page page);
	
	Resource getByUuid(String uuid);
}
