/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.service.impl.component.ResourceServiceImpl.java
 * Class:			ResourceServiceImpl
 * Date:			2013-6-28
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          3.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.service.impl.component;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ketayao.ketacustom.dao.component.ResourceDAO;
import com.ketayao.ketacustom.entity.component.Resource;
import com.ketayao.ketacustom.service.component.ResourceService;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.dwz.PageUtils;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  3.1.0
 * @since   2013-6-28 上午10:23:05 
 */
@Service
@Transactional
public class ResourceServiceImpl implements ResourceService {
	
	@Autowired
	private ResourceDAO resourceDAO;

	/* (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.component.ResourceService#get(java.lang.Long)
	 */
	@Override
	public Resource get(Long id) {
		return resourceDAO.findOne(id);
	}

	/* (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.component.ResourceService#saveOrUpdate(com.ketayao.ketacustom.entity.component.Resource)
	 */
	@Override
	public void saveOrUpdate(Resource resource) {
		resourceDAO.save(resource);
	}

	/* (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.component.ResourceService#delete(java.lang.Long)
	 */
	@Override
	public void delete(Long id) {
		resourceDAO.delete(id);
	}

	/* (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.component.ResourceService#findAll(com.ketayao.ketacustom.util.dwz.Page)
	 */
	@Override
	public List<Resource> findAll(Page page) {
		org.springframework.data.domain.Page<Resource> springDataPage = resourceDAO.findAll(PageUtils.createPageable(page));
		page.setTotalCount(springDataPage.getTotalElements());
		return springDataPage.getContent();
	}

	/* (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.component.ResourceService#findByExample(org.springframework.data.jpa.domain.Specification, com.ketayao.ketacustom.util.dwz.Page)
	 */
	@Override
	public List<Resource> findByExample(Specification<Resource> specification,
			Page page) {
		org.springframework.data.domain.Page<Resource> springDataPage = resourceDAO.findAll(specification, PageUtils.createPageable(page));
		page.setTotalCount(springDataPage.getTotalElements());
		return springDataPage.getContent();
	}

	/* (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.component.ResourceService#getByUuid(java.lang.String)
	 */
	@Override
	public Resource getByUuid(String uuid) {
		return resourceDAO.getByUuid(uuid);
	}
}
