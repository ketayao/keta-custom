/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package	com.ketayao.ketacustom.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.dwz.PageUtils;
import com.ketayao.ketacustom.entity.main.OrganizationRole;
import com.ketayao.ketacustom.dao.OrganizationRoleDAO;
import com.ketayao.ketacustom.service.OrganizationRoleService;

@Service
@Transactional
public class OrganizationRoleServiceImpl implements OrganizationRoleService {
	
	@Autowired
	private OrganizationRoleDAO organizationRoleDAO;

	/*
	 * (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.OrganizationRoleService#get(java.lang.Long)  
	 */ 
	@Override
	public OrganizationRole get(Long id) {
		return organizationRoleDAO.findOne(id);
	}

	/*
	 * (non-Javadoc) 
	 * @see com.ketayao.ketacustom.service.OrganizationRoleService#saveOrUpdate(com.ketayao.ketacustom.entity.main.OrganizationRole)  
	 */
	@Override
	public void saveOrUpdate(OrganizationRole organizationRole) {
		organizationRoleDAO.save(organizationRole);
	}

	/*
	 * (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.OrganizationRoleService#delete(java.lang.Long)  
	 */
	@Override
	public void delete(Long id) {
		organizationRoleDAO.delete(id);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.OrganizationRoleService#findAll(com.ketayao.ketacustom.util.dwz.Page)  
	 */
	@Override
	public List<OrganizationRole> findAll(Page page) {
		org.springframework.data.domain.Page<OrganizationRole> springDataPage = organizationRoleDAO.findAll(PageUtils.createPageable(page));
		page.setTotalCount(springDataPage.getTotalElements());
		return springDataPage.getContent();
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.OrganizationRoleService#findByExample(org.springframework.data.jpa.domain.Specification, com.ketayao.ketacustom.util.dwz.Page)	
	 */
	@Override
	public List<OrganizationRole> findByExample(
			Specification<OrganizationRole> specification, Page page) {
		org.springframework.data.domain.Page<OrganizationRole> springDataPage = organizationRoleDAO.findAll(specification, PageUtils.createPageable(page));
		page.setTotalCount(springDataPage.getTotalElements());
		return springDataPage.getContent();
	}

	/* (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.OrganizationRoleService#findByOrganizationId(java.lang.Long)
	 */
	@Override
	public List<OrganizationRole> findByOrganizationId(Long organizationId) {
		return organizationRoleDAO.findByOrganizationId(organizationId);
	}
}
