/**
 * <pre>
 * Copyright:		Copyright(C) 2012-2013, ketayao.com
 * Filename:		com.ketayao.security.service.impl.RolePermissionImpl.java
 * Class:			RolePermissionImpl
 * Date:			2013-4-16
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          2.0.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ketayao.ketacustom.dao.PermissionDao;
import com.ketayao.ketacustom.entity.main.Permission;
import com.ketayao.ketacustom.service.PermissionService;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  2.0.0
 * @since   2013-4-16 下午2:12:41 
 */
@Service
@Transactional(readOnly=true)
public class PermissionServiceImpl implements PermissionService{
	
	@Autowired
	private PermissionDao permissionDao;

	/**   
	 * @param permission  
	 * @see com.ketayao.ketacustom.service.PermissionService#save(com.ketayao.ketacustom.entity.main.Permission)  
	 */
	@Transactional
	@Override
	public void save(Permission permission) {
		permissionDao.save(permission);
	}

	/**   
	 * @param id
	 * @return  
	 * @see com.ketayao.ketacustom.service.PermissionService#get(java.lang.Long)  
	 */
	@Override
	public Permission get(Long id) {
		return permissionDao.findOne(id);
	}

	/**   
	 * @param permission  
	 * @see com.ketayao.ketacustom.service.PermissionService#update(com.ketayao.ketacustom.entity.main.Permission)  
	 */
	@Transactional
	@Override
	public void update(Permission permission) {
		permissionDao.save(permission);
	}

	/**   
	 * @param id  
	 * @see com.ketayao.ketacustom.service.PermissionService#delete(java.lang.Long)  
	 */
	@Override
	public void delete(Long id) {
		permissionDao.delete(id);
	}
}
