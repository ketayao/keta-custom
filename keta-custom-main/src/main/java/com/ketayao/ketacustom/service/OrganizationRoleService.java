/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package com.ketayao.ketacustom.service;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.ketayao.ketacustom.entity.main.OrganizationRole;
import com.ketayao.ketacustom.util.dwz.Page;

public interface OrganizationRoleService {
	OrganizationRole get(Long id);

	void saveOrUpdate(OrganizationRole organizationRole);

	void delete(Long id);
	
	List<OrganizationRole> findAll(Page page);
	
	List<OrganizationRole> findByExample(Specification<OrganizationRole> specification, Page page);
	
	/**
	 * 根据organizationId，找到已分配的角色。
	 * 描述
	 * @param organizationId
	 * @return
	 */
	List<OrganizationRole> findByOrganizationId(Long organizationId);
}
