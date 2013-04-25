/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ygsoft.security.service.impl.UserRoleServiceImpl.java
 * Class:			UserRoleServiceImpl
 * Date:			2012-8-7
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          1.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.security.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ketayao.security.dao.UserRoleDao;
import com.ketayao.security.entity.main.UserRole;
import com.ketayao.security.service.UserRoleService;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  1.1.0
 * @since   2012-8-7 下午5:09:50 
 */
@Service
@Transactional(readOnly=true)
public class UserRoleServiceImpl implements UserRoleService {

	private UserRoleDao userRoleDao;
	
	/**  
	 * 构造函数
	 * @param jpaRepository  
	 */ 
	@Autowired
	public UserRoleServiceImpl(UserRoleDao userRoleDao) {
		this.userRoleDao = userRoleDao;
	}

	@Transactional
	@Override
	public void save(UserRole userRole) {
		userRoleDao.save(userRole);
	}

	@Transactional
	@Override
	public void delete(Long userRoleId) {
		userRoleDao.delete(userRoleId);
	}

	/**   
	 * @param userId
	 * @return  
	 * @see com.ketayao.security.service.UserRoleService#find(Long)  
	 */
	public List<UserRole> find(Long userId) {
		return userRoleDao.findByUserId(userId);
	}

}
