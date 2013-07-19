/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.dao.component.ResourceDAO.java
 * Class:			ResourceDAO
 * Date:			2013-6-28
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          3.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.dao.component;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.ketayao.ketacustom.entity.component.Resource;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  3.1.0
 * @since   2013-6-28 上午10:18:10 
 */

public interface ResourceDAO extends JpaRepository<Resource, Long> {
	Resource getByUuid(String uuid);
	
	Page<Resource> findByNameContaining(Pageable pageable, String name); 
}
