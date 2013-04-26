/**
 * <pre>
 * Copyright:		Copyright(C) 2012-2013, ketayao.com
 * Filename:		com.ketayao.security.service.impl.OrganizationRoleServiceImpl.java
 * Class:			OrganizationRoleServiceImpl
 * Date:			2013-4-15
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

import com.ketayao.ketacustom.dao.OrganizationRoleDao;
import com.ketayao.ketacustom.entity.main.OrganizationRole;
import com.ketayao.ketacustom.service.OrganizationRoleService;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  2.0.0
 * @since   2013-4-15 下午4:16:04 
 */
@Service
@Transactional(readOnly=true)
public class OrganizationRoleServiceImpl implements OrganizationRoleService {
	
	private OrganizationRoleDao organizationRoleDao;
	
	/**
	 * 
	 * 构造函数
	 * @param organizationRoleDao
	 */
	@Autowired
	public OrganizationRoleServiceImpl(OrganizationRoleDao organizationRoleDao) {
		this.organizationRoleDao = organizationRoleDao;
	}

	/**   
	 * @param organizationId
	 * @return  
	 * @see com.ketayao.ketacustom.service.OrganizationRoleService#find(java.lang.Long)  
	 */
	@Override
	public List<OrganizationRole> find(Long organizationId) {
		return organizationRoleDao.findByOrganizationId(organizationId);
	}

	/**   
	 * @param organizationRole  
	 * @see com.ketayao.ketacustom.service.OrganizationRoleService#save(com.ketayao.ketacustom.entity.main.OrganizationRole)  
	 */
	@Transactional
	@Override
	public void save(OrganizationRole organizationRole) {
		organizationRoleDao.save(organizationRole);
	}

	/**   
	 * @param organizationRoleId  
	 * @see com.ketayao.ketacustom.service.OrganizationRoleService#delete(java.lang.Long)  
	 */
	@Transactional
	@Override
	public void delete(Long organizationRoleId) {
		organizationRoleDao.delete(organizationRoleId);
	}

}
