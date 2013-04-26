/**
 * <pre>
 * Copyright:		Copyright(C) 2012-2013, ketayao.com
 * Filename:		com.ketayao.security.service.impl.RolePermissionServiceImpl.java
 * Class:			RolePermissionServiceImpl
 * Date:			2013-4-16
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          2.0.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ketayao.ketacustom.dao.RolePermissionDao;
import com.ketayao.ketacustom.entity.main.RolePermission;
import com.ketayao.ketacustom.service.RolePermissionService;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  2.0.0
 * @since   2013-4-16 下午2:14:10 
 */
@Service
@Transactional(readOnly=true)
public class RolePermissionServiceImpl implements RolePermissionService {
	
	@Autowired
	private RolePermissionDao rolePermissionDao;

	/**   
	 * @param rolePermission  
	 * @see com.ketayao.ketacustom.service.RolePermissionService#save(com.ketayao.ketacustom.entity.main.RolePermission)  
	 */
	@Transactional
	@Override
	public void save(RolePermission rolePermission) {
		rolePermissionDao.save(rolePermission);
	}

	/**   
	 * @param id
	 * @return  
	 * @see com.ketayao.ketacustom.service.RolePermissionService#get(java.lang.Long)  
	 */
	@Override
	public RolePermission get(Long id) {
		return rolePermissionDao.findOne(id);
	}

	/**   
	 * @param rolePermission  
	 * @see com.ketayao.ketacustom.service.RolePermissionService#update(com.ketayao.ketacustom.entity.main.RolePermission)  
	 */
	@Transactional
	@Override
	public void update(RolePermission rolePermission) {
		rolePermissionDao.save(rolePermission);
	}

	/**   
	 * @param id  
	 * @see com.ketayao.ketacustom.service.RolePermissionService#delete(java.lang.Long)  
	 */
	@Transactional
	@Override
	public void delete(Long id) {
		rolePermissionDao.delete(id);
	}

	/**   
	 * @param roleId
	 * @return  
	 * @see com.ketayao.ketacustom.service.RolePermissionService#findByRoleId(java.lang.Long)  
	 */
	@Override
	public List<RolePermission> findByRoleId(Long roleId) {
		return rolePermissionDao.findByRoleId(roleId);
	}

}
