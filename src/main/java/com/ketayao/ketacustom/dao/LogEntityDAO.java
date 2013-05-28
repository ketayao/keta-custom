/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.dao.LogEntityDao.java
 * Class:			LogEntityDao
 * Date:			2013-5-3
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          2.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.ketayao.ketacustom.entity.main.LogEntity;
import com.ketayao.ketacustom.log.LogLevel;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  2.1.0
 * @since   2013-5-3 下午5:06:37 
 */

public interface LogEntityDAO extends JpaRepository<LogEntity, Long>, JpaSpecificationExecutor<LogEntity>{
	Page<LogEntity> findByLogLevel(LogLevel level, Pageable pageable);
}
