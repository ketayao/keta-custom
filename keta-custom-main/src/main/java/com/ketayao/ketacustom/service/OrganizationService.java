/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package com.ketayao.ketacustom.service;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.ketayao.ketacustom.entity.main.Organization;
import com.ketayao.ketacustom.util.dwz.Page;

public interface OrganizationService {
	Organization get(Long id);

	void saveOrUpdate(Organization organization);

	void delete(Long id);
	
	List<Organization> findAll(Page page);
	
	List<Organization> findByExample(Specification<Organization> specification, Page page);

	Organization getByName(String name);
	
	Organization getTree();
}
